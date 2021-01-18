using LiveConfiguration.Core.Exception;
using LiveConfiguration.Core.Helpers;
using LiveConfiguration.Core.Source;
using Newtonsoft.Json;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using static LiveConfiguration.Core.JsonEntryOptions;

namespace LiveConfiguration.Core.DefaultImpl
{
    /// <inheritdoc/>
    internal class LiveConfiguration : ILiveConfiguration, IDisposable
    {
        #region Members

        private bool mDisposed;
        private DateTimeOffset mExpiration;

        #endregion

        #region Construction

        private readonly ILiveConfigurationSource mSource;
        private readonly ConcurrentDictionary<string, EntryValueReference> mCache;
        private readonly LiveConfigurationOptions mOptions;

        /// <summary>
        /// Creates a new <see cref="ILiveConfiguration"/> instance.
        /// </summary>
        /// <param name="source">The <see cref="ILiveConfigurationSource"/> to use.</param>
        public LiveConfiguration(ILiveConfigurationSource source, LiveConfigurationOptions options)
        {
            mSource = source ?? throw new ArgumentNullException(nameof(source), "The live configuration source cannot be null.");
            mCache = new ConcurrentDictionary<string, EntryValueReference>();
            mOptions = LiveConfigurationOptions.ExistingOrDefault(options);
        }

        /// <summary>
        /// Destructor
        /// </summary>
        ~LiveConfiguration()
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
        public async Task<IEntry> GetEntryAsync(string key)
        {
            CheckDisposed();

            // Get from source
            if(IsExpired() || !mCache.ContainsKey(key))
            {
                // Reads the json from the source
                Dictionary<string, object> json = await mSource.ReadAsync(new EntryReference(key));

                // Parse the entry
                IEntry entry = ParseEntry(json);

                // Set in the cache
                mCache[entry.Key] = new EntryValueReference { Entry = entry };

                return entry;
            }

            // Get from cache
            else
                return (IEntry)mCache[key].Entry;
        }

        /// <inheritdoc/>
        public async Task<IEntryGroup> GetGroupAsync(string name)
        {
            CheckDisposed();

            // Get from source
            if (IsExpired() || !mCache.ContainsKey(name))
            {
                // Reads the json from the source
                Dictionary<string, object> json = await mSource.ReadAsync(new GroupReference(name));

                // Parse the entry group
                IEntryGroup entryGroup = ParseEntryGroup(json);

                // Set in the cache
                mCache[entryGroup.Name] = new EntryValueReference { Entry = entryGroup, IsGroup = true };

                return entryGroup;
            }

            // Get from cache
            else
                return (IEntryGroup)mCache[name].Entry;
        }

        /// <inheritdoc/>
        public async Task UpdateEntryAsync(EntryReference reference, object newValue)
        {
            // Parse path and get initial entry
            string[] path = reference.ToStringArray();
            IEntry entry = await GetEntryAsync(path[0]);

            // Entry not found
            if (entry == null)
                throw new EntryNotFoundException(path[0]);

            // Get until finish
            if (path.Length > 1)
                entry = entry.Value.As<IEntryGroup>().Find(path[1]);

            // Checking entry type
            CheckType(newValue, entry);

            // Set the new value
            (entry as EntryValue).SetValue(newValue);

            // Update in the cache is not expired
            LocalUpdate(entry);

            // Update in the Source
            await mSource.WriteAsync(entry);
        }

        /// <inheritdoc/>
        public async Task<UpdateResult> UpdateManyAsync(IList<KeyValuePair<EntryReference, object>> updates)
        {
            // Get and parse updates
            List<IEntry> updated = new List<IEntry>(updates.Count);
            UpdateResult result = new UpdateResult();
            for(int i = 0; i < updates.Count; i++)
            {
                KeyValuePair<EntryReference, object> update = updates[i];
                EntryReference reference = update.Key;
                object newValue = update.Value;

                // Parse path and get initial entry
                string[] path = reference.ToStringArray();
                IEntry entry = await GetEntryAsync(path[0]);

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
                LocalUpdate(entry);

                // Add to updated
                updated.Add(entry);
                result.SuccessCount += 1;
            }

            // Write to source
            await mSource.WriteAsync(updated);

            return result;
        }

        #endregion

        #region Helper Methods

        private IEntryGroup ParseEntryGroup(Dictionary<string, object> group)
        {
            string name, description;
            List<Dictionary<string, object>> entries;
            try
            {
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
                entriesParsed[i] = ParseEntry(jsonEntry);
            }

            return new EntryGroup(name, description, entriesParsed);
        }

        private IEntry ParseEntry(Dictionary<string, object> entry)
        {
            // Get entries
            string name, description, key;
            Dictionary<string, object> entryValue;
            try
            {
                name = entry.GetValue<string>("name");
                description = entry.GetValue<string>("description");
                key = entry.GetValue<string>("key");
                entryValue = entry.GetValue<Dictionary<string, object>>("value");
            }
            catch(System.Exception ex)
            {
                throw new InvalidEntryException("The entry is malformed.", ex);
            }

            // Check
            if (string.IsNullOrWhiteSpace(name)) throw new InvalidEntryException("The name of the entry is required.");
            if (string.IsNullOrWhiteSpace(key)) throw new InvalidEntryException("The key of the entry is required.");
            if (entryValue == null) throw new InvalidEntryException("An empty value is not allowed.");

            // Parse value
            IEntryValue value = ParseEntryValue(entryValue);
            return new Entry(key, name, description, value);
        }

        private IEntryValue ParseEntryValue(Dictionary<string, object> json)
        {
            ValueType valueType;
            object value;
            try
            {
                valueType = (ValueType)json.GetValue<int>("valueType");
                value = json.GetValue<object>("value");
            } 
            catch(System.Exception ex)
            {
                throw new InvalidEntryException("Cannot parse the value of the entry.", ex);
            }

            // Parse value
            if (value == null) throw new InvalidEntryException("The value of the entry cannot be null.");
            Type objectValueType = value.GetType();
            try
            {
                switch (valueType)
                {
                    case ValueType.String:
                        value = value.ToString();
                        break;

                    case ValueType.Int:
                        value = Convert.ToInt64(value);
                        break;

                    case ValueType.Double:
                        value = Convert.ToDouble(value);
                        break;

                    case ValueType.Boolean:
                        value = Convert.ToBoolean(value);
                        break;

                    case ValueType.Timestamp:
                        value = GetTimestamp(value);
                        break;

                    case ValueType.Duration:
                        value = GetDuration(value);
                        break;

                    case ValueType.Json:
                        value = GetJson(value);
                        break;

                    case ValueType.Subentry:
                        try
                        {
                            Dictionary<string, object> subEntryGroup = (Dictionary<string, object>)value;
                            value = ParseEntryGroup(subEntryGroup);
                        }
                        catch(System.Exception ex)
                        {
                            throw new InvalidValueTypeException($"Cannot parse a subentry value using: ${value}", ex);
                        }
                        break;
                }
            } 
            catch(System.Exception ex)
            {
                throw new InvalidValueTypeException($"Cannot parse {valueType} to {objectValueType.FullName}.", ex);
            }

            return new EntryValue(valueType, value);
        }

        /// <summary>
        /// Checks if the current instance is disposed.
        /// </summary>
        private void CheckDisposed()
        {
            if (mDisposed)
                throw new ObjectDisposedException(typeof(LiveConfiguration).FullName);
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
        /// Converts a timestamp value to a <see cref="DateTimeOffset"/>
        /// </summary>
        private object GetTimestamp(object value)
        {
            if (value is string input && DateTimeOffset.TryParseExact(input, "o", CultureInfo.InvariantCulture, DateTimeStyles.None, out DateTimeOffset result))
                return result;
            else
                throw new InvalidValueTypeException($"Cannot parse a timestamp value using: {value}.");
        }

        /// <summary>
        /// Converts a duration value to a <see cref="TimeSpan"/>
        /// </summary>
        private object GetDuration(object value)
        {
            try
            {
                double input = (double)value;
                return TimeSpan.FromMilliseconds(input);
            }
            catch(System.Exception ex)
            {
                throw new InvalidValueTypeException($"Cannot parse a duration value using: {value}.", ex);
            }
        }

        /// <summary>
        /// Converts a JSON value to its specific type
        /// </summary>
        private object GetJson(object value)
        {
            try
            {
                string base64Input = (string)value;
                string json = Encoding.UTF8.GetString(Convert.FromBase64String(base64Input));
                return JsonConvert.DeserializeObject(json);
            }
            catch(System.Exception ex)
            {
                throw new InvalidValueTypeException($"Cannot parse a JSON value using: {value}", ex);
            }
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
                    if(!(newValue is IEntryGroup))
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
        private void LocalUpdate(IEntry entry)
        {
            if (IsExpired())
                return;

            mCache[entry.Key] = new EntryValueReference { Entry = entry };
        }

        #endregion
    }
}