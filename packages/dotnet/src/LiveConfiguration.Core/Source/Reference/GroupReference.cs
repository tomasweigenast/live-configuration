namespace LiveConfiguration.Core.Source
{
    /// <summary>
    /// Represents a reference to an <see cref="IEntryGroup"/>
    /// </summary>
    public class GroupReference : ConfigurationReference  
    {
        /// <summary>
        /// Creates a new <see cref="GroupReference"/>
        /// </summary>
        /// <param name="groupName">The name of the group</param>
        public GroupReference(string groupName)
        {
            AppendPath($"group={groupName}");
        }
    }
}