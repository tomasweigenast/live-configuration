using LiveConfiguration.Core.Entry;
using LiveConfiguration.Core.Serializer;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace LiveConfiguration.Core
{
    /// <summary>
    /// Exposes methods to fetch, create and sync configuration entries
    /// </summary>
    public interface ILiveConfiguration
    {
        /// <summary>
        /// Returns the current serializer
        /// </summary>
        public ILiveConfigurationSerializer Serializer { get; }

        /// <summary>
        /// Gets a configuration entry
        /// </summary>
        /// <param name="path">The path to the configuration entry.</param>
        public Task<IConfigurationEntry> GetEntryAsync(string path);

        /// <summary>
        /// Gets a configuration group
        /// </summary>
        /// <param name="path">The path to the configuration group.</param>
        public Task<IConfigurationGroup> GetGroupAsync(string path);

        /// <summary>
        /// Gets all the configuration groups
        /// </summary>
        public Task<IEnumerable<IConfigurationGroup>> GetAllAsync();

        /// <summary>
        /// Updates a configuration entry
        /// </summary>
        /// <param name="path">The path to the entry.</param>
        /// <param name="value">The value to set.</param>
        public Task UpdateAsync(string path, object value);

        /// <summary>
        /// Creates a new entry
        /// </summary>
        /// <param name="path">The path of the entry.</param>
        /// <param name="name">The name of the entry.</param>
        /// <param name="description">The description of the entry.</param>
        /// <param name="valueType">The value type to hold.</param>
        /// <param name="value">The value to set.</param>
        /// <param name="metadata">Any metadata to add to the entry.</param>
        public Task CreateAsync(string path, string name, string description, EntryValueType valueType, object value, IEnumerable<KeyValuePair<string, string>> metadata);
    }
}