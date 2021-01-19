namespace LiveConfiguration.Core.Source
{
    /// <summary>
    /// A reference to an unknown entry in a configuration source.
    /// </summary>
    public abstract class ConfigurationReference
    {
        /// <summary>
        /// The reference path
        /// </summary>
        public string Path { get; }

        /// <summary>
        /// The parent reference or null if this is the root reference.
        /// </summary>
        public ConfigurationReference Parent { get; }

        /// <summary>
        /// Returns the length of the Path levels
        /// </summary>
        public int Size => Path?.Split('/').Length ?? 0;

        protected ILiveConfiguration mLiveConfiguration;

        /// <summary>
        /// Initializes the configuration reference a gives an initial path
        /// </summary>
        /// <param name="parent">The parent reference, if any.</param>
        /// <param name="reference">The id of the entry.</param>
        protected ConfigurationReference(ILiveConfiguration configuration, ConfigurationReference parent, string reference)
        {
            mLiveConfiguration = configuration;
            Parent = parent;
            Path = $"{(parent != null ? parent.Path : "")}/{reference}";
        }
    }
}