using LiveConfiguration.Core.Source;
using System;

namespace LiveConfiguration.Core.DependencyInjection
{
    /// <summary>
    /// Provides methods to setup a <see cref="ILiveConfiguration"/> instance.
    /// </summary>
    public class LiveConfigurationSetup
    {
        private ILiveConfigurationSource mSource;
        private LiveConfigurationOptions mOptions;

        internal ILiveConfigurationSource Source => mSource;
        internal LiveConfigurationOptions Options => mOptions;

        internal LiveConfigurationSetup() { }

        /// <summary>
        /// Sets the <see cref="ILiveConfigurationSource"/> to use.
        /// </summary>
        /// <typeparam name="TSource">The <see cref="ILiveConfigurationSource"/> implementation type.</typeparam>
        public LiveConfigurationSetup WithSource<TSource>() where TSource : ILiveConfigurationSource
        {
            try
            {
                mSource = Activator.CreateInstance<TSource>();
            }
            catch (System.Exception ex)
            {
                throw new ArgumentException($"Cannot create an instance of {typeof(TSource).FullName} because it does not have any public parameterless constructor.", ex);
            }
            return this;
        }

        /// <summary>
        /// Sets the <see cref="ILiveConfigurationSource"/> to use.
        /// </summary>
        /// <typeparam name="TSource">The <see cref="ILiveConfigurationSource"/> implementation type.</typeparam>
        /// <param name="implementation">The instance to the implementation to use.</param>
        public LiveConfigurationSetup WithSource<TSource>(TSource implementation) where TSource : ILiveConfigurationSource
        {
            mSource = implementation;
            return this;
        }

        /// <summary>
        /// Sets the <see cref="LiveConfigurationOptions"/> to use.
        /// </summary>
        /// <param name="options">The options to use.</param>
        public LiveConfigurationSetup WithOptions(LiveConfigurationOptions options)
        {
            mOptions = options;
            return this;
        }

        /// <summary>
        /// Sets the <see cref="LiveConfigurationOptions"/> to use.
        /// </summary>
        /// <param name="configureAction">The action used to configure.</param>
        public LiveConfigurationSetup WithOptions(Action<LiveConfigurationOptions> configureAction)
        {
            mOptions = new LiveConfigurationOptions();
            configureAction.Invoke(mOptions);

            mOptions = LiveConfigurationOptions.ExistingOrDefault(mOptions);
            return this;
        }
    }
}