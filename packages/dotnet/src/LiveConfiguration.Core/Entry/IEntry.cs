using System.Collections.Generic;

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

        /// <summary>
        /// Indicates if the entry is editable or not. Defaults to true true.
        /// It can be useful if you want to block an entry to prevent updates.
        /// </summary>
        public bool IsEditable { get; }

        /// <summary>
        /// Indicates if the entry is public or not. Defaults to true.
        /// This property can be used to filter entries when they are public to some backend users.
        /// </summary>
        public bool IsPublic { get; }

        /// <summary>
        /// Returns the configuration entry as a dictionary.
        /// </summary>
        public Dictionary<string, object> ToDictionary();
    }
}