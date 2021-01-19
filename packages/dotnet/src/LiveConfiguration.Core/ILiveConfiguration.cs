using LiveConfiguration.Core.Exception;
using LiveConfiguration.Core.Source;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace LiveConfiguration.Core
{
    /// <summary>
    /// Defines the main entry point to a configuration source.
    /// </summary>
    public interface ILiveConfiguration
    {
        /// <summary>
        /// The name of the instance
        /// </summary>
        public string Name { get; }

        /// <summary>
        /// Gets an entry by its key
        /// </summary>
        /// <param name="reference">The reference to the entry.</param>
        /// <returns>The <see cref="IEntry"/>, or null if the entry could not be found.</returns>
        Task<IEntry> GetEntryAsync(ConfigurationReference reference);

        /// <summary>
        /// Gets a entry group by its name
        /// </summary>
        /// <param name="reference">The reference to the group.</param>
        /// <returns>The <see cref="IEntryGroup"/> or null, if the group could not be found.</returns>
        Task<IEntryGroup> GetGroupAsync(ConfigurationReference reference);

        /// <summary>
        /// Gets all the groups at once
        /// </summary>
        Task<IEnumerable<IEntryGroup>> GetAllAsync();

        /// <summary>
        /// Updates an entry.
        /// </summary>
        /// <param name="reference">The reference to the entry to update.</param>
        /// <param name="newValue">The new value to set.</param>
        /// <exception cref="EntryNotFoundException">The entity was not found.</exception>
        /// <exception cref="InvalidValueTypeException">The type of <paramref name="newValue"/> does not match with the target <see cref="IEntry"/> value type.</exception>
        Task UpdateEntryAsync(ConfigurationReference reference, object newValue);

        /// <summary>
        /// Updates many entries at once.
        /// </summary>
        /// <param name="updates">The entry references to update.</param>
        /// <exception cref="EntryNotFoundException">The entity was not found.</exception>
        /// <exception cref="InvalidValueTypeException">The type of the new value does not match with the target <see cref="IEntry"/> value type.</exception>
        Task<UpdateResult> UpdateManyAsync(IList<KeyValuePair<ConfigurationReference, object>> updates);

        /// <summary>
        /// Creates a reference to an <see cref="IEntryGroup"/>
        /// </summary>
        /// <param name="id">The id of the group.</param>
        GroupReference Group(string id);
    }
}