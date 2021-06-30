using System.Threading.Tasks;

namespace LiveConfiguration.Core.Extensions
{
    public static class LiveConfigurationExtensions
    {
        /// <summary>
        /// Gets a configuration entry and parses its value to a generic type
        /// </summary>
        /// <typeparam name="T">The type to convert the value to.</typeparam>
        /// <param name="configuration">The <see cref="ILiveConfiguration"/> instance.</param>
        /// <param name="path">The path to get.</param>
        public static async Task<T> GetValueAsync<T>(this ILiveConfiguration configuration, string path)
        {
            IConfigurationEntry entry = await configuration.GetEntryAsync(path);
            return entry.Parse<T>();
        }
    }
}