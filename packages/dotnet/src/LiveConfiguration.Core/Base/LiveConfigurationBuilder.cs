using LiveConfiguration.Core.Impl;
using LiveConfiguration.Core.Serializer;
using LiveConfiguration.Core.Source;

namespace LiveConfiguration.Core.Base
{
    /// <summary>
    /// Provides methods to build a <see cref="ILiveConfiguration"/>
    /// </summary>
    public class LiveConfigurationBuilder
    {
        private ILiveConfigurationSource mSource;
        private ILiveConfigurationSerializer mSerializer;
        private LiveConfigurationOptions mOptions;

        private LiveConfigurationBuilder() { }

        /// <summary>
        /// Creates a new <see cref="LiveConfigurationBuilder"/>
        /// </summary>
        public static LiveConfigurationBuilder Create()
            => new();

        /// <summary>
        /// Set the options of the <see cref="ILiveConfiguration"/>
        /// </summary>
        /// <param name="options">The options to set.</param>
        public LiveConfigurationBuilder WithOptions(LiveConfigurationOptions options)
        {
            mOptions = options;
            return this;
        }

        /// <summary>
        /// Set the serializer of the <see cref="ILiveConfiguration"/>
        /// </summary>
        /// <param name="serializer">The serializer to set.</param>
        public LiveConfigurationBuilder WithSerializer(ILiveConfigurationSerializer serializer)
        {
            mSerializer = serializer;
            return this;
        }

        /// <summary>
        /// Set the source of the <see cref="ILiveConfiguration"/>
        /// </summary>
        /// <param name="source">The source to set.</param>
        public LiveConfigurationBuilder WithSource(ILiveConfigurationSource source)
        {
            mSource = source;
            return this;
        }

        /// <summary>
        /// Builds the <see cref="ILiveConfiguration"/>
        /// </summary>
        public ILiveConfiguration Build()
            => new LiveConfigurationImpl(mSource, mSerializer, mOptions);
    }
}