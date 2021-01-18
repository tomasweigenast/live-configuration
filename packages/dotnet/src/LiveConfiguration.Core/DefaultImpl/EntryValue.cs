namespace LiveConfiguration.Core.DefaultImpl
{
    /// <summary>
    /// <inheritdoc/>
    /// </summary>
    internal class EntryValue : IEntryValue
    {
        private readonly object mRawValue;
        private readonly ValueType mValueType;

        public EntryValue(ValueType valueType, object rawValue)
        {
            mRawValue = rawValue;
            mValueType = valueType;
        }

        /// <inheritdoc/>
        public ValueType Type => mValueType;

        /// <inheritdoc/>
        public object GetRawValue()
            => mRawValue;
    }
}