using LiveConfiguration.Core.Exception;
using LiveConfiguration.Core.Helpers;
using LiveConfiguration.Core.Source;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using static LiveConfiguration.Core.JsonEntryOptions;

namespace LiveConfiguration.Core.DefaultImpl
{
    /// <inheritdoc/>
    internal class DefaultLiveConfiguration : ILiveConfiguration, IDisposable
    {
        #region Members

        private bool mDisposed;
        private DateTimeOffset mExpiration;

        #endregion

        #region Properties

    /// <inheritdoc/>
        public string Name { get; }

        #endregion

        #region Construction

        private readonly ILiveConfigurationSource mSource;
        private readonly ConcurrentDictionary<string, IEntryGroup> mCache;
        private readonly LiveConfigurationOptions mOptions;

        /// <summary>
        /// Creates a new <see cref="ILiveConfiguration"/> instance.
        /// </summary>
        /// <param name="source">The <see cref="ILiveConfigurationSource"/> to use.</param>
        public DefaultLiveConfiguration(string name, ILiveConfigurationSource source, LiveConfigurationOptions options)
        {
            mSource = source ?? throw new ArgumentNullException(nameof(source), "The live configuration source cannot be null.");
            mCache = new ConcurrentDictionary<string, IEntryGroup>();
            mOptions = LiveConfigurationOptions.ExistingOrDefault(options);
            Name = name;
        }

        /// <summary>
        /// Destructor
        /// </summary>
        ~DefaultLiveConfiguration()
        {
            Dispose(false);
        }

        public void Dispose()
        {
            Dispose(true);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!mDisposed)
            {
                if (disposing)
                    GC.SuppressFinalize(this);

                mDisposed = true;
            }
        }

        #endregion

        #region Methods

        /// <inheritdoc/>
        public async Task<IEntry> GetEntryAsync(ConfigurationReference reference)
        {
            CheckDisposed();

            string[] path = reference.ToStringArray();
            string groupId = path[0];

            // Get group
            IEntryGroup group = await GetGroupAsync(new GroupReference(this, null, groupId));

            if (group == null)
                return null;

            return group.Find(string.Join("/", path.Skip(1)));
        }

        /// <inheritdoc/>
        public async Task<IEntryGroup> GetGroupAsync(ConfigurationReference reference)
        {
            CheckDisposed();

            string[] path = reference.ToStringArray();
            string groupId = path[0];

            // Get from source
            if (IsExpired() || !mCache.ContainsKey(groupId))
            {
                // Reads the json from the source
                Dictionary<string, object> json = await mSource.ReadAsync(reference);

                // Parse the entry group
                IEntryGroup entryGroup = ParseEntryGroup(json);

                // Set in the cache
                mCache[entryGroup.Id] = entryGroup;

                return entryGroup;
            }

            // Get from cache
            else
                return mCache[groupId];
        }

        /// <inheritdoc/>
        public async Task UpdateEntryAsync(ConfigurationReference reference, object newValue)
        {
            // Get entry
            IEntry entry = await GetEntryAsync(reference);

            // Entry not found
            if (entry == null)
                throw new EntryNotFoundException(reference.Path);

            string[] path = reference.ToStringArray();

            // Checking entry type
            CheckType(newValue, entry);

            // Set the new value
            (entry.Value as EntryValue).SetValue(newValue);

            // Update in the cache is not expired
            LocalUpdate(entry, path);

            // Update in the Source
            await mSource.WriteAsync(reference, entry.ToDictionary());
        }

        /// <inheritdoc/>
        public async Task<UpdateResult> UpdateManyAsync(IList<KeyValuePair<ConfigurationReference, object>> updates)
        {
            // Get and parse updates
            List<KeyValuePair<Dictionary<string, object>, ConfigurationReference>> updated = new List<KeyValuePair<Dictionary<string, object>, ConfigurationReference>>(updates.Count);
            UpdateResult result = new UpdateResult();
            for(int i = 0; i < updates.Count; i++)
            {
                KeyValuePair<ConfigurationReference, object> update = updates[i];
                string[] path = update.Key.ToStringArray();
                EntryReference reference = new EntryReference(this, update.Key.Parent, path[^1]);
                object newValue = update.Value;

                // Parse path and get initial entry
                IEntry entry = await GetEntryAsync(reference);

                // Entry not found
                if (entry == null)
                {
                    result.FailedCount += 1;
                    result.Exceptions[i] = new EntryNotFoundException(path[0]);
                }

                // Get until finish
                if (path.Length > 1)
                    entry = entry.Value.As<IEntryGroup>().Find(path[1]);

                // Checking entry type
                CheckType(newValue, entry);

                // Set the new value
                (entry as EntryValue).SetValue(newValue);

                // Update in the cache is not expired
                LocalUpdate(entry, path);

                // Add to updated
                updated.Add(new KeyValuePair<Dictionary<string, object>, ConfigurationReference>(entry.ToDictionary(), reference));
                result.SuccessCount += 1;
            }

            // Write to source
            await mSource.WriteAsync(updated);

            return result;
        }

        /// <inheritdoc/>
        public GroupReference Group(string id) => new GroupReference(this, null, id);

        #endregion

        #region Helper Methods

        private IEntryGroup ParseEntryGroup(Dictionary<string, object> group)
        {
            string name, description, id;
            List<Dictionary<string, object>> entries;
            try
            {
                id = group.GetValue<string>("id");
                name = group.GetValue<string>("name");
                description = group.GetValue<string>("description");
                entries = group.GetValue<List<Dictionary<string, object>>>("entries");
            }
            catch (System.Exception ex)
            {
                throw new InvalidEntryException("The entry group is malformed.", ex);
            }

            if (string.IsNullOrWhiteSpace(name)) throw new InvalidEntryException("The name of the group is required.");

            // Parse entries
            IEntry[] entriesParsed = new IEntry[entries.Count];
            for(int i = 0; i < entries.Count; i++)
            {
                Dictionary<string, object> jsonEntry = entries[i];
                entriesParsed[i] = ValueSerializer.Deserialize(jsonEntry);
            }

            return new EntryGroup(id, name, description, entriesParsed);
        }

        /// <summary>
        /// Checks if the current instance is disposed.
        /// </summary>
        private void CheckDisposed()
        {
            if (mDisposed)
                throw new ObjectDisposedException(typeof(DefaultLiveConfiguration).FullName);
        }

        /// <summary>
        /// Returns true if the cache items are expired.
        /// </summary>
        private bool IsExpired()
        {
            if (DateTimeOffset.UtcNow > mExpiration)
            {
                mExpiration = DateTimeOffset.UtcNow.Add(mOptions.CacheExpiration);
                mCache.Clear();
                return true;
            }
            else
                return false;
        }

        /// <summary>
        /// Checks if an object is the same type as the entry value type
        /// </summary>
        private void CheckType(object newValue, IEntry entry)
        {
            ValueType entryValueType = entry.Value.Type;
            object oldValue = entry.Value.GetRawValue();

            switch (entryValueType)
            {
                case ValueType.String:
                    if (!(newValue is string))
                        throw new InvalidValueTypeException($"Cannot convert a '{newValue}' to an string.");
                    break;

                case ValueType.Int:
                    if (!(newValue is int || newValue is long || newValue is uint || newValue is ulong || newValue is short || newValue is ushort))
                        throw new InvalidValueTypeException($"Cannot convert a '{newValue}' to a valid number.");
                    break;

                case ValueType.Double:
                    if(!(newValue is double || newValue is float || newValue is decimal))
                        throw new InvalidValueTypeException($"Cannot convert a '{newValue}' to a valid double precision number.");
                    break;

                case ValueType.Boolean:
                    if (!(newValue is bool))
                        throw new InvalidValueTypeException($"Cannot convert a '{newValue}' to a boolean.");
                    break;

                case ValueType.Duration:
                    if (!(newValue is TimeSpan))
                        throw new InvalidValueTypeException($"Cannot convert a '{newValue}' to a duration.");
                    break;

                case ValueType.Timestamp:
                    if (!(newValue is DateTime || newValue is DateTimeOffset))
                        throw new InvalidValueTypeException($"Cannot convert a '{newValue}' to a timestamp.");
                    break;

                case ValueType.Json:
                    if(mOptions.JsonOptions.CheckingType == JsonCheckingType.None)
                        break;

                    JsonChecking(mOptions.JsonOptions.CheckingType, oldValue, newValue);
                    break;

                case ValueType.Subentry:
                    if(!(newValue is IEnumerable<IEntry>))
                        throw new InvalidValueTypeException($"Cannot convert a '{newValue}' to a Subentry.");
                    break;
            }
        }

        /// <summary>
        /// Does the json type checking
        /// </summary>
        private void JsonChecking(JsonCheckingType checkingType, object oldValue, object newValue)
        {
            Type oldType = oldValue.GetType();
            Type newType = newValue.GetType();

            if (checkingType == JsonCheckingType.TypeChecking)
            {
                // If its a JToken derived type, try to convert to new type
                if(typeof(JToken).IsAssignableFrom(oldType))
                    try { (oldValue as JToken).ToObject(newType); oldType = newType; } catch { }

                if (oldType != newType)
                    throw new JsonMismatchException($"JSON type checking failed: old type is {oldType.FullName} while new type is {newType.FullName}.");
                else
                    return;
            }
            else if (checkingType == JsonCheckingType.HardChecking)
            {
                foreach (PropertyInfo property in newType.GetProperties())
                {
                    PropertyInfo oldValueProperty = oldType.GetProperty(property.Name);
                    if (oldValueProperty == null)
                        throw new JsonMismatchException($"JSON hard checking failed: its not allowed to remove existing properties.");
                }
            }
        }

        /// <summary>
        /// Updates an entry in the local cache if not expired
        /// </summary>
        /// <param name="entry">The entry to update.</param>
        private void LocalUpdate(IEntry entry, string[] path)
        {
            if (IsExpired())
                return;

            try
            {
                IEntryGroup group = mCache[path[0]];
                if (group != null)
                {
                    if(path.Length == 2)
                        group.Update(entry);
                    else
                    {
                        IEntry parent = group.Find(path[1]);
                        if(parent != null)
                        {
                            List<IEntry> entries = parent.Value.As<List<IEntry>>();
                            for(int i = 0; i < entries.Count; i++)
                            {
                                IEntry entryToUpdate = entries[i];
                                if(entryToUpdate.Key == entry.Key)
                                {
                                    entries[i] = entry;
                                    break;
                                }
                            }

                            (parent.Value as EntryValue).SetValue(entries);
                            group.Update(parent);
                        }
                    }
                }
            }
            catch { }
        }

        #endregion
    }
}