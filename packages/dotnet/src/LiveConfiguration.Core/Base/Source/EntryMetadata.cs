using System.Collections.Generic;

namespace LiveConfiguration.Core.Source
{
    /// <summary>
    /// Contains metadata about an entry
    /// </summary>
    public abstract class EntryMetadata
    {
        /// <summary>
        /// The configuration entry key
        /// </summary>
        public string Key { get; set; }

        /// <summary>
        /// The configuration entry name
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// The configuration entry description
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        /// Any metadata information about the entry
        /// </summary>
        public IEnumerable<KeyValuePair<string, object>> Metadata { get; set; }
    }
}