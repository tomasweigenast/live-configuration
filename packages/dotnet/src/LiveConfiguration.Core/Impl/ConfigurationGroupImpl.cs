using System.Collections.Generic;

namespace LiveConfiguration.Core.Impl
{
    internal class ConfigurationGroupImpl : IConfigurationGroup
    {
        #region Properties

        public string Name { get; set; }

        public string Description { get; set; }

        public IEnumerable<IConfigurationEntry> Entries { get; set; }

        public string Key { get; set; }

        #endregion
    }
}