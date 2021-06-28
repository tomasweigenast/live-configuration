using LiveConfiguration.Core.Serializer;
using LiveConfiguration.Core.Source;

namespace LiveConfiguration.Core.Extensions
{
    /// <summary>
    /// Provides properties to configure a <see cref="ILiveConfiguration"/> while injecting as a service
    /// </summary>
    public class LiveConfigurationConfigure
    {
        /// <summary>
        /// The source of the <see cref="ILiveConfiguration"/>
        /// </summary>
        public ILiveConfigurationSource Source { get; set; }

        /// <summary>
        /// The serializer to use
        /// </summary>
        public ILiveConfigurationSerializer Serializer { get; set; }

        /// <summary>
        /// The options to configure the <see cref="ILiveConfiguration"/>
        /// </summary>
        public LiveConfigurationOptions Options { get; set; }
    }
}