using System;

namespace LiveConfiguration.Core
{
    /// <summary>
    /// Configuration options for a <see cref="ILiveConfiguration"/>
    /// </summary>
    public class LiveConfigurationOptions
    {
        /// <summary>
        /// The expiration duration of the cache items.
        /// Defaults to: 15 minutes.
        /// </summary>
        public TimeSpan CacheExpiration { get; set; }

        /// <summary>
        /// The options while encoding and decoding <see cref="ValueType.Json"/> types.
        /// </summary>
        public JsonEntryOptions JsonOptions { get; set; }

        /// <summary>
        /// Returns a new instance of <see cref="LiveConfigurationOptions"/> with the default values
        /// </summary>
        public static LiveConfigurationOptions Default()
            => new LiveConfigurationOptions
            {
                CacheExpiration = TimeSpan.FromMinutes(15),
                JsonOptions = new JsonEntryOptions
                {
                    CheckingType = JsonEntryOptions.JsonCheckingType.TypeChecking
                }
            };

        /// <summary>
        /// Returns a new instance of the properties with the default values where are not initialized.
        /// </summary>
        internal static LiveConfigurationOptions ExistingOrDefault(LiveConfigurationOptions options)
        {
            if (options == null)
                return Default();

            if (options.JsonOptions == null)
                options.JsonOptions = new JsonEntryOptions
                {
                    CheckingType = JsonEntryOptions.JsonCheckingType.TypeChecking
                };

            return options;
        }
    }

    /// <summary>
    /// Configuration options that handles how is the behaviour while decoding and encoding
    /// <see cref="ValueType.Json"/> types.
    /// </summary>
    public class JsonEntryOptions
    {
        /// <summary>
        /// The checking type done while decoding.
        /// Defaults to: <see cref="JsonCheckingType.TypeChecking"/>
        /// </summary>
        public JsonCheckingType CheckingType { get; set; }

        /// <summary>
        /// The checking type used while decoding and encoding
        /// </summary>
        public enum JsonCheckingType
        {
            /// <summary>
            /// When this is used, the type of the objects are checked, the name of the properties
            /// and its not allowed to remove existing ones.
            /// </summary>
            HardChecking,

            /// <summary>
            /// Only checks if the type of the objects match
            /// </summary>
            TypeChecking,

            /// <summary>
            /// No checking is made. This ensures the maximum performance without concistency.
            /// </summary>
            None
        }
    }
}