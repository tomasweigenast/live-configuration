using System;

namespace LiveConfiguration.Core
{
    /// <summary>
    /// Options to configure a <see cref="ILiveConfiguration"/> instance
    /// </summary>
    public class LiveConfigurationOptions
    {
        /// <summary>
        /// The cache time to live. Set to <see cref="TimeSpan.Zero"/> to remove cache.
        /// Defaults to: 1 hour
        /// </summary>
        public TimeSpan CacheTtl { get; set; } = TimeSpan.FromHours(1);
    }
}