using LiveConfiguration.Core.Entry;

namespace LiveConfiguration.Core.Source
{
    /// <summary>
    /// Contains metada about an <see cref="IConfigurationEntry"/>
    /// </summary>
    public class EntrySource : EntryMetadata
    {
        /// <summary>
        /// The raw value of the entry source
        /// </summary>
        public object RawValue { get; set; }

        /// <summary>
        /// The value type of the entry
        /// </summary>
        public EntryValueType ValueType { get; set; }
    }
}