namespace LiveConfiguration.Core.Exception
{
    /// <summary>
    /// Exception thrown when an <see cref="IEntry"/> is not found
    /// </summary>
    public class EntryNotFoundException : System.Exception
    {
        /// <summary>
        /// The name of the entry not found
        /// </summary>
        public string EntryName { get; }

        /// <summary>
        /// Creates a new instance
        /// </summary>
        /// <param name="path">The path to the entry that was not found.</param>
        public EntryNotFoundException(string path) : base($"The entry located at '{path}' could not be found.")
        {
            EntryName = path;
        }
    }
}