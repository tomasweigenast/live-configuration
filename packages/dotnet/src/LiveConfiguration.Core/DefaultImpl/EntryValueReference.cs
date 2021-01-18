namespace LiveConfiguration.Core.DefaultImpl
{
    /// <summary>
    /// Represents either an <see cref="IEntryGroup"/> or an <see cref="IEntry"/>
    /// </summary>
    internal class EntryValueReference
    {
        public bool IsGroup { get; set; }

        public object Entry { get; set; }
    }
}