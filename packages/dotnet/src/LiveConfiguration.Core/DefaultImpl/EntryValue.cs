using Newtonsoft.Json;
using System;

namespace LiveConfiguration.Core.DefaultImpl
{
    /// <summary>
    /// <inheritdoc/>
    /// </summary>
    internal class EntryValue : IEntryValue
    {
        private object mRawValue;
        private readonly ValueType mValueType;

        public EntryValue(ValueType valueType, object rawValue)
        {
            mRawValue = rawValue;
            mValueType = valueType;
        }

        /// <inheritdoc/>
        public ValueType Type => mValueType;

        /// <inheritdoc/>
        public T As<T>()
        {
            try
            {
                return (T)mRawValue;
            }
            catch { }

            try
            {
                return (T)Convert.ChangeType(mRawValue, typeof(T));
            }
            catch { };

            try
            {
                return JsonConvert.DeserializeObject<T>((string)mRawValue);
            }
            catch(System.Exception ex)
            {
                throw new ArgumentException($"Cannot convert {mRawValue.GetType()} to {typeof(T)} after trying implicit cast, Convert.ChangeType() and JsonConvert.DeserializeObject()", ex);
            }
        }

        /// <inheritdoc/>
        public object GetRawValue()
            => mRawValue;

        /// <summary>
        /// Sets the new raw value
        /// </summary>
        /// <param name="newValue">The new value.</param>
        public void SetValue(object newValue)
        {
            mRawValue = newValue;
        }
    }
}