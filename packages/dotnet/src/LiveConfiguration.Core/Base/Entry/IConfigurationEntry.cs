using LiveConfiguration.Core.Entry;
using System.Collections.Generic;

namespace LiveConfiguration.Core
{
    /// <summary>
    /// Contains information about a configuration entry, such as its name, description,
    /// key, value and metadata
    /// </summary>
    public interface IConfigurationEntry
    {
        #region Properties

        /// <summary>
        /// The name of the entry
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// A description about the configuration entry
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        /// The key of the configuration entry.
        /// </summary>
        public string Key { get; set; }

        /// <summary>
        /// The value type of the entry
        /// </summary>
        public EntryValueType ValueType { get; set; }

        /// <summary>
        /// The raw value of the entry
        /// </summary>
        public object RawValue { get; set; }

        /// <summary>
        /// Any key-value pair metadata information about this configuration entry
        /// </summary>
        public IEnumerable<KeyValuePair<string, object>> Metadata { get; set; }

        #endregion

        #region Methods

        /// <summary>
        /// Parses the current configuration entry to an specific type
        /// </summary>
        public T Parse<T>();

        #endregion
    }
}