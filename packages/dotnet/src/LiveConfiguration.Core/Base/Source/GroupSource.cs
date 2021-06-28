using System.Collections.Generic;

namespace LiveConfiguration.Core.Source
{
    /// <summary>
    /// Contains metada about an <see cref="IConfigurationGroup"/>
    /// </summary>
    public class GroupSource : EntryMetadata
    {
        /// <summary>
        /// The list of entries in this group
        /// </summary>
        public IEnumerable<EntrySource> Entries { get; set; }
    }
}