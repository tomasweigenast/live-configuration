using LiveConfiguration.Core.Serializer;
using System.Threading.Tasks;

namespace LiveConfiguration.Core
{
    /// <summary>
    /// Exposes methods to fetch, create and sync configuration entries
    /// </summary>
    public interface ILiveConfiguration
    {
        /// <summary>
        /// Returns the current serializer
        /// </summary>
        public ILiveConfigurationSerializer Serializer { get; }

        /// <summary>
        /// Gets a configuration entry
        /// </summary>
        /// <param name="path">The path to the configuration entry.</param>
        public Task<IConfigurationEntry> GetEntryAsync(string path);

        /// <summary>
        /// Gets a configuration group
        /// </summary>
        /// <param name="path">The path to the configuration group.</param>
        public Task<IConfigurationGroup> GetGroupAsync(string path);
    }
}