using System.Threading.Tasks;

namespace LiveConfiguration.Core.Source
{
    /// <summary>
    /// A reference to an <see cref="IEntryGroup"/>
    /// </summary>
    public class GroupReference : ConfigurationReference
    {
        internal GroupReference(ILiveConfiguration configuration, ConfigurationReference parent, string groupId) : base(configuration, parent, $"group={groupId}") { }

        /// <summary>
        /// Creates a <see cref="EntryReference"/> for a child entry of this reference.
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        public EntryReference Entry(string key)
            => new EntryReference(mLiveConfiguration, this, key);

        /// <summary>
        /// Gets the entry group
        /// </summary>
        public async Task<IEntryGroup> GetAsync()
            => await mLiveConfiguration.GetGroupAsync(this);
    }
}