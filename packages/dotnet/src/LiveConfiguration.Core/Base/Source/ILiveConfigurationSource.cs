using System.Collections.Generic;
using System.Threading.Tasks;

namespace LiveConfiguration.Core.Source
{
    /// <summary>
    /// Represents the source of the configuration entries
    /// </summary>
    public interface ILiveConfigurationSource
    {
        /// <summary>
        /// Writes one or more entries to the provider
        /// </summary>
        /// <param name="entries">The entries to write. The key of the value pair represents the path to write the entry to, and the value the entry to write.</param>
        /// <returns>The number of entries written.</returns>
        Task<int> WriteAsync(IEnumerable<KeyValuePair<string, EntrySource>> entries);

        /// <summary>
        /// Reads entries from the specified path.
        /// </summary>
        /// <param name="path">The path to the entry to read.</param>
        /// <returns>The list of entries that matches the path.</returns>
        Task<IEnumerable<EntryMetadata>> ReadAsync(string path);
    }
}