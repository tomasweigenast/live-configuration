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
    }
}