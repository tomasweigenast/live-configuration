using LiveConfiguration.Core.Source;
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

        private readonly ConcurrentDictionary<string, GroupSource> mGroups;

        /// <summary>
        /// Default constructor
        /// </summary>
        public MemoryLiveConfigurationSource()
        {
            mGroups = new ConcurrentDictionary<string, GroupSource>();
        }

        /// <summary>
        /// Constructor that populate default items. Useful for testing purposes
        /// </summary>
        /// <param name="initialItems">The initial groups to set.</param>
        public MemoryLiveConfigurationSource(IEnumerable<GroupSource> initialItems) : this()
        {
            foreach (GroupSource entry in initialItems)
                mGroups[entry.Key] = entry;
        }

        #endregion

        #region Methods

        public Task WriteAsync(IEnumerable<KeyValuePair<string, EntrySource>> entries)
        {
            foreach(var entry in entries)
            {
                string[] path = entry.Key.Split('/');
                GroupSource group = mGroups[path[0]];
                if(group != null)
                {
                    var groupEntries = group.Entries.ToList();
                    groupEntries.RemoveAll(x => x.Key == path[1]);
                    groupEntries.Add(entry.Value);

                    group.Entries = groupEntries;
                }
            }

            return Task.CompletedTask;
        }

        public Task<EntryMetadata> ReadAsync(string path)
        {
            string[] pathParts = path.Split('/');
            bool isGroup = pathParts.Length % 2 != 0;
            if (isGroup)
                return Task.FromResult((EntryMetadata)mGroups[pathParts[0]]);
            else
            {
                var group = mGroups[pathParts[0]];
                return Task.FromResult((EntryMetadata)group.Entries.FirstOrDefault(x => x.Key == pathParts[1]));
            }
        }

        #endregion
    }
}