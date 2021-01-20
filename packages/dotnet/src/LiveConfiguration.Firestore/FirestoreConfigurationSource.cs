using Google.Cloud.Firestore;
using LiveConfiguration.Core.Source;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LiveConfiguration.Firestore
{
    /// <summary>
    /// Implementation of <see cref="ILiveConfigurationSource"/> which uses Firestore as backend of the entries
    /// </summary>
    public class FirestoreConfigurationSource : ILiveConfigurationSource
    {
        #region Construction

        private readonly FirestoreSourceOptions mOptions;
        private readonly FirestoreDb mFirestore;

        /// <summary>
        /// Default constructor with initialization options
        /// </summary>
        /// <param name="options">The options to use.</param>
        public FirestoreConfigurationSource(FirestoreSourceOptions options)
        {
            mOptions = options ?? throw new ArgumentNullException(nameof(options), "Options cannot be null.");
            if (string.IsNullOrWhiteSpace(options.ProjectId)) throw new ArgumentNullException(nameof(options.ProjectId));
            if (string.IsNullOrWhiteSpace(options.CollectionName)) options.CollectionName = "server_settings";

            mFirestore = new FirestoreDbBuilder
            {
                ChannelCredentials = mOptions.Credentials,
                ProjectId = mOptions.ProjectId,
                EmulatorDetection = Google.Api.Gax.EmulatorDetection.EmulatorOrProduction,
                Endpoint = mOptions.Endpoint
            }.Build();
        }

        #endregion

        #region Methods

        ///<inheritdoc/>
        public async Task<Dictionary<string, object>> ReadAsync(ConfigurationReference reference)
        {
            string[] path = reference.Path.Split('/', StringSplitOptions.RemoveEmptyEntries).Take(2).Select(x => x.Split('=', StringSplitOptions.RemoveEmptyEntries)[1]).ToArray();
            
            // Read groups
            if(path.Length == 1)
            {
                // Get all groups
                if(path[0] == ".")
                {
                    // Get the root collection
                    CollectionReference root = mFirestore.Collection(mOptions.CollectionName);
                    QuerySnapshot snapshot = await root.GetSnapshotAsync();

                    if (snapshot.Count <= 0)
                        return null;

                    List<Dictionary<string, object>> groups = new List<Dictionary<string, object>>(snapshot.Count);

                    foreach (DocumentSnapshot document in snapshot.Documents)
                    {
                        // Parse to dictionary
                        Dictionary<string, object> groupDictionary = document.ToDictionary();

                        // Get entries
                        QuerySnapshot entriesSnapshot = await document.Reference.Collection("entries").GetSnapshotAsync();
                        if (entriesSnapshot.Count > 0)
                            groupDictionary["entries"] = entriesSnapshot.Documents.Select(x => x.ToDictionary()).ToList();

                        groups.Add(groupDictionary);
                    }

                    return new Dictionary<string, object>
                    {
                        { "groups", groups }
                    };
                }

                // Get a single group
                else
                {
                    // Create reference and get snapshot
                    DocumentReference groupReference = mFirestore.Collection(mOptions.CollectionName).Document(path[0]);
                    DocumentSnapshot groupSnapshot = await groupReference.GetSnapshotAsync();

                    if (!groupSnapshot.Exists)
                        return null;

                    // Parse to dictionary
                    Dictionary<string, object> group = groupSnapshot.ToDictionary();

                    // Get entries
                    QuerySnapshot entriesSnapshot = await groupReference.Collection("entries").GetSnapshotAsync();
                    if (entriesSnapshot.Count > 0)
                        group["entries"] = entriesSnapshot.Documents.Select(x => x.ToDictionary()).ToList();

                    return group;
                }
            }

            // Read a single entry
            else
            {
                DocumentReference documentReference = ToDocumentReference(path);
                DocumentSnapshot snapshot = await documentReference.GetSnapshotAsync();

                if (!snapshot.Exists)
                    return null;

                return snapshot.ToDictionary();
            }
        }

        ///<inheritdoc/>
        public async Task WriteAsync(ConfigurationReference reference, Dictionary<string, object> entry)
        {
            string[] path = reference.Path.Split('/', StringSplitOptions.RemoveEmptyEntries).Select(x => x.Split('=', StringSplitOptions.RemoveEmptyEntries)[1]).ToArray();

            string groupId = path[0];
            DocumentReference groupReference = mFirestore.Collection(mOptions.CollectionName).Document(groupId);

            // Write an entire group
            if(path.Length == 1)
                await groupReference.SetAsync(entry, SetOptions.MergeAll);
            
            // Write a single entry
            else
            {
                // Get the reference to the root entry
                DocumentReference entryReference = groupReference.Collection("entries").Document(path[1]);
                
                // Contains a subentry, so find it and update
                if(path.Length > 2)
                {
                    // Run as a transaction so the root entry can be read and then update its children
                    await mFirestore.RunTransactionAsync(async (transaction) =>
                    {
                        DocumentSnapshot entrySnapshot = await transaction.GetSnapshotAsync(entryReference);
                        if (!entrySnapshot.Exists)
                            return;

                        try
                        {
                            // Parse the entry
                            Dictionary<string, object> rootEntry = entrySnapshot.ToDictionary();
                            Dictionary<string, object> rootEntryValue = rootEntry["value"] as Dictionary<string, object>;
                            List<object> subEntryValuesObj = rootEntryValue["value"] as List<object>;
                            
                            for(int i = 0; i < subEntryValuesObj.Count; i++)
                            {
                                // Find the sub entry
                                Dictionary<string, object> subEntry = (Dictionary<string, object>)subEntryValuesObj[i];
                                if(subEntry["key"] as string == path[2])
                                {
                                    // Update the value
                                    subEntryValuesObj[i] = entry;
                                    rootEntryValue["value"] = subEntryValuesObj;
                                    rootEntry["value"] = rootEntryValue;

                                    break;
                                }
                            }

                            // Merge the list
                            transaction.Update(entryReference, rootEntry);
                        }
                        catch(Exception ex)
                        {
                            return;
                        }
                    });
                }

                // Otherwise, simple write the entry
                else
                    await entryReference.SetAsync(entry, SetOptions.MergeAll);
                
            }
        }

        ///<inheritdoc/>
        public async Task WriteAsync(IEnumerable<KeyValuePair<Dictionary<string, object>, ConfigurationReference>> entries)
        {
            WriteBatch batch = mFirestore.StartBatch();

            foreach(KeyValuePair<Dictionary<string, object>, ConfigurationReference> entry in entries)
            {
                string[] path = entry.Value.Path.Split('/', StringSplitOptions.RemoveEmptyEntries).Take(2).Select(x => x.Split('=', StringSplitOptions.RemoveEmptyEntries)[1]).ToArray();

                string groupId = path[0];
                DocumentReference groupReference = mFirestore.Collection(mOptions.CollectionName).Document(groupId);

                // Write an entire group
                if (path.Length == 1)
                    batch.Set(groupReference, entry, SetOptions.MergeAll);

                // Write a single entry
                else
                {
                    DocumentReference entryReference = groupReference.Collection("entries").Document(path[1]);
                    batch.Set(entryReference, entry.Key, SetOptions.MergeAll);
                }
            }

            await batch.CommitAsync();
        }

        #endregion

        #region Helper Methods

        private DocumentReference ToDocumentReference(string[] path)
            => mFirestore.Collection(mOptions.CollectionName).Document(string.Join('/', path));

        #endregion
    }
}