using LiveConfiguration.Core.Entry;
using LiveConfiguration.Core.Helpers;
using System.Collections.Generic;

namespace LiveConfiguration.Core.Impl
{
    internal class ConfigurationEntryImpl : IConfigurationEntry
    {
        #region Properties

        public string Name { get; set; }

        public string Description { get; set; }

        public string Key { get; set; }

        public IEnumerable<KeyValuePair<string, string>> Metadata { get; set; }

        public object RawValue { get; set; }

        public EntryValueType ValueType { get; set; }

        #endregion

        #region Methods

        public T Parse<T>()
            => TypeConverter.ConvertTo<T>(RawValue, ValueType);

        #endregion
    }
}