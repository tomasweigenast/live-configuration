namespace LiveConfiguration.Core
{
    /// <summary>
    /// Represents the value type a <see cref="IEntryValue"/> stores.
    /// </summary>
    public enum ValueType
    {
        /// <summary>
        /// A plain string
        /// </summary>
        String,

        /// <summary>
        /// Any integer number, positive or negative.
        /// </summary>
        Int,

        /// <summary>
        /// Any double value.
        /// </summary>
        Double,

        /// <summary>
        /// A boolean value
        /// </summary>
        Boolean,
        
        /// <summary>
        /// A timestamp representing a date and time which can contain an offset.
        /// </summary>
        Timestamp,

        /// <summary>
        /// A duration value
        /// </summary>
        Duration,

        /// <summary>
        /// A nested <see cref="IEntry"/>
        /// </summary>
        Subentry,
        
        /// <summary>
        /// A JSON value
        /// </summary>
        Json
    }
}