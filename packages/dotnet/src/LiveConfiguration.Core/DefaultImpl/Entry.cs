using System.Collections.Generic;

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

        /// <inheritdoc/>
        public bool IsEditable { get; }

        /// <inheritdoc/>
        public bool IsPublic { get; }

        public Entry(string key, string name, string description, bool isEditable, bool isPublic, IEntryValue value)
        {
            Key = key;
            Name = name;
            Description = description;
            Value = value;
            IsPublic = isPublic;
            IsEditable = isEditable;
        }

        /// <inheritdoc/>
        public override string ToString()
            => $"{Name} ({Key})";

        /// <inheritdoc/>
        public Dictionary<string, object> ToDictionary()
            => new Dictionary<string, object>
            {
                { "name", Name },
                { "key", Key },
                { "description", Description },
                { "isPublic", IsPublic },
                { "isEditable", IsEditable },
                { "value", ValueSerializer.Serialize(Value) },
            };
    }
}