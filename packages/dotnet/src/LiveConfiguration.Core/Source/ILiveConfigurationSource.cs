using System.Collections.Generic;
using System.Threading.Tasks;

namespace LiveConfiguration.Core.Source
{
    /// <summary>
    /// Represents a <see cref="ILiveConfiguration"/> source where the data is stored and retrieved from.
    /// </summary>
    public interface ILiveConfigurationSource
    {
        /// <summary>
        /// Writes an entry
        /// </summary>
        /// <param name="reference">The reference of the entry.</param>
        /// <param name="entry">The entry to write.</param>
        Task WriteAsync(ConfigurationReference reference, Dictionary<string, object> entry);

        /// <summary>
        /// Writes many entries at once
        /// </summary>
        /// <param name="entries">The entries to write.</param>
        Task WriteAsync(IEnumerable<KeyValuePair<Dictionary<string, object>, ConfigurationReference>> entries);

        /// <summary>
        /// Reads a reference
        /// </summary>
        /// <param name="reference">The reference to read.</param>
        /// <returns>The reference snapshot.</returns>
        Task<Dictionary<string, object>> ReadAsync(ConfigurationReference reference);
    }
}