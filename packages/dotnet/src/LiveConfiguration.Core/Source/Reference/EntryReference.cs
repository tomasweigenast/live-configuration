namespace LiveConfiguration.Core.Source
{
    /// <summary>
    /// Represents a reference to an <see cref="IEntry"/>
    /// </summary>
    public class EntryReference : ConfigurationReference  
    {
        /// <summary>
        /// Creates a new <see cref="EntryReference"/>
        /// </summary>
        /// <param name="key">The key of the entry</param>
        public EntryReference(string key)
        {
            AppendPath($"entry={key}");
        }
    }
}