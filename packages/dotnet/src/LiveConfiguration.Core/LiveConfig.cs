using LiveConfiguration.Core.DefaultImpl;
using LiveConfiguration.Core.Source;
using System;

namespace LiveConfiguration.Core
{
    /// <summary>
    /// Provides methods to create and generate <see cref="ILiveConfiguration"/> instances.
    /// </summary>
    public static class LiveConfig
    {
        /// <summary>
        /// Creates a new <see cref="LiveConfigurationBuilder"/> to build an <see cref="ILiveConfiguration"/>
        /// </summary>
        /// <param name="name">The name of the final <see cref="ILiveConfiguration"/> instance.</param>
        public static LiveConfigurationBuilder Create(string name)
            => new LiveConfigurationBuilder(name);
    }

    /// <summary>
    /// Contains chainable methods to build an <see cref="ILiveConfiguration"/>
    /// </summary>
    public sealed class LiveConfigurationBuilder
    {
        private string mName;
        private ILiveConfigurationSource mSource;
        private LiveConfigurationOptions mOptions;

        /// <summary>
        /// Internal constructor
        /// </summary>
        internal LiveConfigurationBuilder(string name) 
        {
            mName = name;
        }

        /// <summary>
        /// Sets the options for the <see cref="ILiveConfiguration"/>
        /// </summary>
        public LiveConfigurationBuilder WithOptions(LiveConfigurationOptions options)
        {
            mOptions = options;
            return this;
        }

        /// <summary>
        /// Sets the options for the <see cref="ILiveConfiguration"/>
        /// </summary>
        public LiveConfigurationBuilder WithOptions(Action<LiveConfigurationOptions> configure)
        {
            mOptions = LiveConfigurationOptions.Default();
            configure.Invoke(mOptions);
            return this;
        }

        /// <summary>
        /// Specifies the <see cref="ILiveConfigurationSource"/> source to use.
        /// </summary>
        public LiveConfigurationBuilder WithSource(ILiveConfigurationSource source)
        {
            mSource = source;
            return this;
        }

        /// <summary>
        /// Builds the <see cref="ILiveConfiguration"/> instance.
        /// </summary>
        public ILiveConfiguration Build()
        {
            // Ensure options
            LiveConfigurationOptions.ExistingOrDefault(mOptions);

            if (mSource == null) throw new ArgumentNullException("source", "Cannot create an ILiveConfiguration without a source. Specify it using the WithSource(ILiveConfigurationSource) method.");
            if (string.IsNullOrWhiteSpace(mName)) mName = Guid.NewGuid().ToString("n");

            return new DefaultLiveConfiguration(mName, mSource, mOptions);
        }
    }
}