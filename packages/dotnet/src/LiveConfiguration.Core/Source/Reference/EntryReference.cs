using System.Threading.Tasks;

namespace LiveConfiguration.Core.Source
{
    /// <summary>
    /// A reference to an <see cref="IEntry"/>
    /// </summary>
    public class EntryReference : ConfigurationReference
    {
        internal EntryReference(ILiveConfiguration configuration, ConfigurationReference parent, string key) : base(configuration, parent, $"entry={key}") { }
        
        /// <summary>
        /// Creates a <see cref="EntryReference"/> for a nested entry of this reference.
        /// </summary>
        /// <param name="key">The key of the nested entry.</param>
        public EntryReference Entry(string key)
            => new EntryReference(mLiveConfiguration, this, key);

        /// <summary>
        /// Gets the entry
        /// </summary>
        public async Task<IEntry> GetAsync()
            => await mLiveConfiguration.GetEntryAsync(this);
    }
}