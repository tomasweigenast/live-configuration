using LiveConfiguration.Core;
using LiveConfiguration.Core.Source;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LiveConfiguration.Memory
{
    /// <summary>
    /// Implementation of <see cref="ILiveConfigurationSource"/> which stores entries in memory. Useful for development purposes.
    /// </summary>
    public class MemoryLiveConfigurationSource : ILiveConfigurationSource
    {
        #region Construction

        private readonly ConcurrentDictionary<string, Dictionary<string, object>> mEntries;

        /// <summary>
        /// Default constructor
        /// </summary>
        public MemoryLiveConfigurationSource()
        {
            mEntries = new ConcurrentDictionary<string, Dictionary<string, object>>();
        }

        /// <summary>
        /// Constructor that populate default items. Useful for testing purposes
        /// </summary>
        /// <param name="initialItems">The initial groups to set.</param>
        public MemoryLiveConfigurationSource(IEnumerable<IEntryGroup> initialItems) : this()
        {
            foreach(IEntryGroup entry in initialItems)
                mEntries[entry.Id] = entry.ToDictionary();
        }

        #endregion

        #region Methods

        /// <inheritdoc/>
        public Task<Dictionary<string, object>> ReadAsync(ConfigurationReference reference)
        {
            // Parse and get path
            ReferencePath[] path = reference.Path
                .Split('/', StringSplitOptions.RemoveEmptyEntries)
                .Select(x => x.Split('=', StringSplitOptions.RemoveEmptyEntries))
                .Select(x => new ReferencePath
                {
                    Key = x[1],
                    IsGroup = x[0] == "group"
                })
                .ToArray();

            // Get group
            Dictionary<string, object> group = mEntries[path.First().Key];

            if (group == null)
                return null;

            if (path.Length == 1)
                return Task.FromResult(group);

            // Get last path
            ReferencePath lastPath = path[^1];
            Dictionary<string, object> entry = group
                .Where(x => x.Key == "entries")
                .Select(x => x.Value as List<Dictionary<string, object>>)
                .Where(x => x.Any(b => (b["key"] as string) == lastPath.Key))
                .FirstOrDefault()
                .Select(x => x)
                .Where(x => x["key"] as string == lastPath.Key)
                .FirstOrDefault();

            if (entry != null)
                return Task.FromResult(entry);
            else
                return Task.FromResult<Dictionary<string, object>>(null);

        }

        /// <inheritdoc/>
        public Task WriteAsync(ConfigurationReference reference, Dictionary<string, object> entry)
        {
            if (reference is GroupReference)
                WriteGroup(entry);
            else
                WriteEntry(entry);

            return Task.CompletedTask;
        }

        /// <inheritdoc/>
        public Task WriteAsync(IEnumerable<KeyValuePair<Dictionary<string, object>, ConfigurationReference>> entries)
        {
            foreach(KeyValuePair<Dictionary<string, object>, ConfigurationReference> entry in entries)
            {
                if (entry.Value is GroupReference)
                    WriteGroup(entry.Key);
                else
                    WriteEntry(entry.Key);
            }

            return Task.CompletedTask;
        }

        #endregion

        #region Helpers

        private void WriteGroup(Dictionary<string, object> dictionary)
        {
            string name = dictionary["name"] as string;
            string description = dictionary["description"] as string;
            List<Dictionary<string, object>> entries = dictionary["entries"] as List<Dictionary<string, object>>;
            dictionary["isGroup"] = true;

            mEntries[name] = dictionary;
        }

        private void WriteEntry(Dictionary<string, object> dictionary)
        {
            string key = dictionary["key"] as string;
            dictionary["isGroup"] = false;
            mEntries[key] = dictionary;
        }

        private class ReferencePath
        {
            public bool IsGroup { get; set; }

            public string Key { get; set; }
        }

        #endregion
    }
}