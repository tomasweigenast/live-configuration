using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;

namespace LiveConfiguration.Core
{
    /// <summary>
    /// Represents a group of <see cref="IConfigurationEntry"/>
    /// </summary>
    public interface IConfigurationGroup
    {
        /// <summary>
        /// The key of the configuration group
        /// </summary>
        public string Key { get; set; }

        /// <summary>
        /// The name of the configuration group
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// Any description of the configuration group
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        /// The list of entries of the group
        /// </summary>
        public IEnumerable<IConfigurationEntry> Entries { get; set; }
    }
}