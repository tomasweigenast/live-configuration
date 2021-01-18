using LiveConfiguration.Core.Exception;
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
        /// Gets an entry by its key
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        /// <returns>The <see cref="IEntry"/>, or null if the entry could not be found.</returns>
        Task<IEntry> GetEntryAsync(string key);

        /// <summary>
        /// Grs a entry group by its name
        /// </summary>
        /// <param name="name">The name of the group.</param>
        /// <returns>The <see cref="IEntryGroup"/> or null, if the group could not be found.</returns>
        Task<IEntryGroup> GetGroupAsync(string name);

        /// <summary>
        /// Updates an entry.
        /// </summary>
        /// <param name="entryKey">The key of the <see cref="IEntry"/> to update.</param>
        /// <param name="newValue">The new value to set.</param>
        /// <exception cref="EntryNotFoundException">The entity was not found.</exception>
        /// <exception cref="InvalidValueTypeException">The type of <paramref name="newValue"/> does not match with the target <see cref="IEntry"/> value type.</exception>
        Task UpdateEntryAsync(string entryKey, object newValue);

        /// <summary>
        /// Updates many entries at once.
        /// </summary>
        /// <param name="updates">The key of the <see cref="IEntry"/> to update.</param>
        /// <exception cref="EntryNotFoundException">The entity was not found.</exception>
        /// <exception cref="InvalidValueTypeException">The type of <paramref name="newValue"/> does not match with the target <see cref="IEntry"/> value type.</exception>
        Task<UpdateResult> UpdateManyAsync(IEnumerable<KeyValuePair<string, object>> updates);
    }
}