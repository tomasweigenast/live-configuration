namespace LiveConfiguration.Core
{
    /// <summary>
    /// Contains the value of an <see cref="IEntry"/>
    /// </summary>
    public interface IEntryValue
    {
        /// <summary>
        /// The entry value type
        /// </summary>
        public ValueType Type { get; }

        /// <summary>
        /// Returns the raw value
        /// </summary>
        public object GetRawValue();

        /// <summary>
        /// Converts the <see cref="IEntryValue"/> raw value
        /// to a specific type.
        /// </summary>
        T As<T>();
    }
}