using LiveConfiguration.Core.Impl;
using Microsoft.Extensions.DependencyInjection;
using System;

namespace LiveConfiguration.Core.Extensions
{
    /// <summary>
    /// Provides methods to inject a <see cref="ILiveConfiguration"/> instance to dependency injection
    /// </summary>
    public static class DependencyInjectionExtensions
    {
        /// <summary>
        /// Adds the <see cref="ILiveConfiguration"/>
        /// </summary>
        public static IServiceCollection AddLiveConfiguration(this IServiceCollection services, Action<LiveConfigurationConfigure> configureAction)
        {
            LiveConfigurationConfigure configuration = new();
            configureAction.Invoke(configuration);

            return services.AddSingleton<ILiveConfiguration>((factory) => new LiveConfigurationImpl(configuration.Source, configuration.Serializer, configuration.Options));
        }
    }
}