namespace LiveConfiguration.Core.DefaultImpl
{
    /// <inheritdoc/>
    internal class Entry : IEntry
    {
        /// <inheritdoc/>
        public string Key { get; }

        /// <inheritdoc/>
        public string Name { get; }

        /// <inheritdoc/>
        public string Description { get; }

        /// <inheritdoc/>
        public IEntryValue Value { get; }

        public Entry(string key, string name, string description, IEntryValue value)
        {
            Key = key;
            Name = name;
            Description = description;
            Value = value;
        }

        /// <inheritdoc/>
        public override string ToString()
            => $"{Name} ({Key})";
    }
}