using System;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;

namespace LiveConfiguration.Core.Serializer
{
    /// <summary>
    /// Serializes configuration entries
    /// </summary>
    public interface ILiveConfigurationSerializer
    {
        public static readonly byte[] ContractNameSpecialDelimiter = BitConverter.GetBytes(0x987987);
        
        /// <summary>
        /// The name of the contract so clients know which serializer to use
        /// </summary>
        public string ContractName { get; }

        /// <summary>
        /// Serializes to a <see cref="Stream"/>
        /// </summary>
        /// <param name="configurationGroups">The list of <see cref="IConfigurationGroup"/> to serialize.</param>
        /// <param name="filter">A function used to filter configuration groups or entries from the serialization.</param>
        Stream Serialize(IEnumerable<IConfigurationGroup> configurationGroups, Func<IConfigurationGroup, bool> filter);

        /// <summary>
        /// Asynchonously serializes to a <see cref="Stream"/>
        /// </summary>
        /// <param name="configurationGroups">The list of <see cref="IConfigurationGroup"/> to serialize.</param>
        /// <param name="filter">A function used to filter configuration groups or entries from the serialization.</param>
        Task<Stream> SerializeAsync(IEnumerable<IConfigurationGroup> configurationGroups, Func<IConfigurationGroup, bool> filter);
    }
}