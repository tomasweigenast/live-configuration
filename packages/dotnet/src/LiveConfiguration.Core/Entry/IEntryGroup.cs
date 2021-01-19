using System.Collections.Generic;

namespace LiveConfiguration.Core
{
    /// <summary>
    /// Represents a collection of <see cref="IEntry"/> which can contain a name
    /// </summary>
    public interface IEntryGroup : IEnumerable<IEntry>
    {
        /// <summary>
        /// The count of entries in the group
        /// </summary>
        public int Count { get; }

        /// <summary>
        /// The name of the colletion
        /// </summary>
        public string Name { get; }

        /// <summary>
        /// The description of the group
        /// </summary>
        public string Description { get; }

        /// <summary>
        /// The id of the group
        /// </summary>
        public string Id { get; }

        /// <summary>
        /// Finds an <see cref="IEntry"/> searching by its key
        /// </summary>
        /// <param name="key">The key of the entry to search.</param>
        IEntry Find(string key);

        /// <summary>
        /// Updates an value
        /// </summary>
        /// <param name="entry">The entry to update.</param>
        void Update(IEntry entry);

        /// <summary>
        /// Returns a dictionary representing the actual group
        /// </summary>
        Dictionary<string, object> ToDictionary();
    }
}