using LiveConfiguration.Core.Source;
using Microsoft.Extensions.DependencyInjection;
using System;

namespace LiveConfiguration.Core.DependencyInjection
{
    /// <summary>
    /// Provides methods to inject an instance of <see cref="ILiveConfiguration"/> into the services
    /// </summary>
    public static class DependencyInjectionExtensions
    {
        /// <summary>
        /// Injects a singleton instance of <see cref="ILiveConfiguration"/>.
        /// </summary>
        /// <param name="services">The services to inject the instance to.</param>
        /// <param name="source">The configuration source.</param>
        /// <param name="options">The options to configure the instance.</param>
        public static IServiceCollection AddLiveConfiguration(this IServiceCollection services, ILiveConfigurationSource source, LiveConfigurationOptions options)
            => services.AddSingleton<ILiveConfiguration>(new DefaultImpl.DefaultLiveConfiguration("DependencyInjection", source, options));

        /// <summary>
        /// Injects a singleton instance of <see cref="ILiveConfiguration"/>.
        /// </summary>
        /// <param name="services">The services to inject the instance to.</param>
        /// <param name="setupAction">The action to setup the instance.</param>
        public static IServiceCollection AddLiveConfiguration(this IServiceCollection services, Action<LiveConfigurationSetup> setupAction)
        {
            LiveConfigurationSetup setup = new LiveConfigurationSetup();
            setupAction.Invoke(setup);

            if (setup.Source == null) throw new ArgumentNullException("source", "Source cannot be null.");

            return AddLiveConfiguration(services, setup.Source, setup.Options);
        }
    }
}