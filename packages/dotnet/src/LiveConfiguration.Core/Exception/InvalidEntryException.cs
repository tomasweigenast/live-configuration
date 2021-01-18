namespace LiveConfiguration.Core.Exception
{
    /// <summary>
    /// Exception thrown when its tried to parse an <see cref="IEntry"/> and its mal formed.
    /// </summary>
    public class InvalidEntryException : System.Exception
    {
        /// <summary>
        /// The key of the entry mal formed
        /// </summary>
        public string EntryKey { get; }

        /// <summary>
        /// Creates a new instance
        /// </summary>
        public InvalidEntryException(string entryKey, string message) : base(message)
        {
            EntryKey = entryKey;
        }

        /// <summary>
        /// Creates a new instance
        /// </summary>
        public InvalidEntryException(string message) : base(message) { }

        /// <summary>
        /// Creates a new instance
        /// </summary>
        public InvalidEntryException(string message, System.Exception innerException) : base(message, innerException) { }
    }
}