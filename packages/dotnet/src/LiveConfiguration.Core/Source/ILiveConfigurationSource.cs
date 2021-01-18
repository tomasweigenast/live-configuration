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
        /// <param name="entry">The entry to write.</param>
        Task WriteAsync(IEntry entry);

        /// <summary>
        /// Writes many entries at once
        /// </summary>
        /// <param name="entries">The entries to write.</param>
        Task WriteAsync(IEnumerable<IEntry> entries);

        /// <summary>
        /// Reads a reference
        /// </summary>
        /// <param name="reference">The reference to read.</param>
        Task<IEntry> ReadAsync(ConfigurationReference reference);
    }
}