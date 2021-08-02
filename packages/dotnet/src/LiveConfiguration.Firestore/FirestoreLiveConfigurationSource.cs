using Google.Api.Gax;
using Google.Cloud.Firestore;
using Google.Protobuf;
using Grpc.Core;
using LiveConfiguration.Core.Entry;
using LiveConfiguration.Core.Exception;
using LiveConfiguration.Core.Source;
using LiveConfiguration.Provider.Firestore;
using MessagePack;
using MessagePack.Resolvers;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace LiveConfiguration.Firestore
{
    /// <summary>
    /// Implementation of <see cref="ILiveConfigurationSource"/> which uses Firestore as backend of the entries
    /// </summary>
    public class FirestoreLiveConfigurationSource : ILiveConfigurationSource
    {
        #region Construction

        private readonly FirestoreSourceOptions mOptions;
        private readonly FirestoreDb mFirestore;

        /// <summary>
        /// Default constructor with initialization options
        /// </summary>
        /// <param name="options">The options to use.</param>
        public FirestoreLiveConfigurationSource(FirestoreSourceOptions options)
        {
            mOptions = options ?? throw new ArgumentNullException(nameof(options), "Options cannot be null.");
            if (string.IsNullOrWhiteSpace(options.ProjectId)) throw new ArgumentNullException("ProjectId");
            if (string.IsNullOrWhiteSpace(options.CollectionName)) options.CollectionName = "serverSettings";

            mFirestore = new FirestoreDbBuilder
            {
                ChannelCredentials = mOptions.EmulatorDetection == EmulatorDetection.EmulatorOnly ? ChannelCredentials.Insecure : mOptions.Credentials,
                ProjectId = mOptions.ProjectId,
                EmulatorDetection = mOptions.EmulatorDetection,
            }.Build();
        }

        #endregion

        #region Methods

        /// <inheritdoc/>
        public async Task<IEnumerable<EntryMetadata>> ReadAsync(string path)
        {
            string[] pathParts = path.Split('/', StringSplitOptions.RemoveEmptyEntries);
            bool isGroup = pathParts.Length % 2 != 0;

            CollectionReference query = mFirestore.Collection(mOptions.CollectionName);
            
            // Get all
            if(pathParts.Length == 2 && pathParts.All(x => x == "*"))
            {
                // Get all the groups
                QuerySnapshot groupsSnapshot = await query.GetSnapshotAsync();
                if (groupsSnapshot.Count == 0)
                    return null;

                EntryMetadata[] entries = new EntryMetadata[groupsSnapshot.Count];
                for(int i = 0; i < groupsSnapshot.Count; i++)
                {
                    // Get every entry from the group
                    DocumentSnapshot groupSnapshot = groupsSnapshot.Documents[i];
                    QuerySnapshot entriesSnapshot = await groupSnapshot.Reference.Collection("entries").GetSnapshotAsync();

                    // Decode group
                    GroupSource source = await DeserializeGroup(groupSnapshot, entriesSnapshot);
                    entries[i] = source;
                }

                return entries;
            }
            else
            {
                if (isGroup)
                {
                    var groupQuery = query.Document(pathParts[0]);
                    GroupSource source = await DeserializeGroup(await groupQuery.GetSnapshotAsync(), await groupQuery.Collection("entries").GetSnapshotAsync());
                    return new EntryMetadata[] { source };
                }
                else
                {
                    var documentSnapshot = await query.Document(pathParts[0]).Collection("entries").Document(pathParts[1]).GetSnapshotAsync();
                    EntrySource source = await DeserializeEntry(documentSnapshot);
                    return new EntryMetadata[] { source };
                }
            }
        }

        /// <inheritdoc/>
        public async Task WriteAsync(IEnumerable<KeyValuePair<string, EntrySource>> entries)
        {
            await mFirestore.RunTransactionAsync(async (transaction) =>
            {
                foreach(var entry in entries)
                {
                    if (entry.Key.Split('/').Length % 2 != 0)
                        throw new ArgumentException("Path must contain even parts.");

                    string[] pathParts = entry.Key.Split('/');

                    object serializedEntry = SerializeEntry(entry.Value, pathParts[1]);
                    DocumentReference documentReference = mFirestore.Collection(mOptions.CollectionName).Document(pathParts[0]).Collection("entries").Document(pathParts[1]);

                    if (serializedEntry is Stream stream)
                        transaction.Set(documentReference, new Dictionary<string, object> 
                        {
                            { "buffer", Blob.FromByteString(await ByteString.FromStreamAsync(stream)) }

                        }, SetOptions.MergeFields("buffer"));
                    else if (serializedEntry is Dictionary<string, object> fields)
                        transaction.Set(documentReference, fields, SetOptions.MergeAll);
                }
            });
        }

        #endregion

        #region Helper Methods

        private async Task<GroupSource> DeserializeGroup(DocumentSnapshot groupSnapshot, QuerySnapshot entriesSnapshot)
        {
            Dictionary<string, object> fields;
            List<EntrySource> entries = new();
            if (mOptions.Serializer == Serializer.Json)
            {
                fields = groupSnapshot.ToDictionary();

                // Deserialize entries
                foreach (DocumentSnapshot document in entriesSnapshot.Documents)
                    entries.Add(await DeserializeEntry(document));
            }
            else
            {
                // Get blob buffer
                if (!groupSnapshot.TryGetValue<Blob>("buffer", out Blob documentBuffer))
                    throw new InvalidEntryException($"Buffer was not found on group {groupSnapshot.Reference.Path}");

                MemoryStream ms = new();
                documentBuffer.ByteString.WriteTo(ms);

                // Deserialize with MessagePack
                var result = await MessagePackSerializer.DeserializeAsync<Dictionary<object, object>>(ms, ContractlessStandardResolver.Options);
                fields = result.ToDictionary(k => k.Key.ToString(), v => v.Value);
            }

            return new GroupSource()
            {
                Key = fields.GetValueOrDefault<string>("key"),
                Name = fields.GetValueOrDefault<string>("name"),
                Description = fields.GetValueOrDefault<string>("description"),
                Metadata = fields.GetValueOrDefault<IEnumerable<KeyValuePair<string, string>>>("metadata"),
                Entries = entries
            };
        }

        private async Task<EntrySource> DeserializeEntry(DocumentSnapshot document)
        {
            Dictionary<string, object> fields;
            if (mOptions.Serializer == Serializer.Json)
                fields = document.ToDictionary();
            else
            {
                // Get blob buffer
                if (!document.TryGetValue("buffer", out Blob documentBuffer))
                    throw new InvalidEntryException($"Buffer was not found on entry {document.Reference.Path}");

                MemoryStream ms = new();
                documentBuffer.ByteString.WriteTo(ms);

                // Deserialize with MessagePack
                var result = await MessagePackSerializer.DeserializeAsync<Dictionary<object, object>>(ms, ContractlessStandardResolver.Options);
                fields = result.ToDictionary(k => k.Key.ToString(), v => v.Value);
            }

            return new EntrySource
            {
                Key = fields.GetValueOrDefault<string>("key"),
                Name = fields.GetValueOrDefault<string>("name"),
                Description = fields.GetValueOrDefault<string>("description"),
                Metadata = fields.GetValueOrDefault<IEnumerable<KeyValuePair<string, string>>>("metadata"),
                ValueType = fields.GetValueOrDefault<EntryValueType>("valueType"),
                RawValue = fields.GetValueOrDefault<object>("value"),
            };
        }

        private async Task<object> SerializeEntry(EntrySource entry, string key)
        {
            Dictionary<string, object> fields = new()
            {
                { "key", key },
                { "name", entry.Name },
                { "description", entry.Description },
                { "metadata", entry.Metadata },
                { "valueType", entry.ValueType },
                { "value", entry.RawValue },
            };

            // Serialize
            if (mOptions.Serializer == Serializer.MessagePack)
            {
                MemoryStream output = new();
                await MessagePackSerializer.SerializeAsync(output, fields, ContractlessStandardResolver.Options);

                return output;
            }
            else
                return fields;
        }

        #endregion
    }
}