namespace LiveConfiguration.Core
{
    /// <summary>
    /// Represents a configuration entry in a source.
    /// </summary>
    public interface IEntry
    {
        /// <summary>
        /// The key of the configuration entry
        /// </summary>
        public string Key { get; }

        /// <summary>
        /// A friendly name of the entry
        /// </summary>
        public string Name { get; }

        /// <summary>
        /// An optional description for the entry
        /// </summary>
        public string Description { get; }

        /// <summary>
        /// The value of the entry
        /// </summary>
        public IEntryValue Value { get; }
    }
}