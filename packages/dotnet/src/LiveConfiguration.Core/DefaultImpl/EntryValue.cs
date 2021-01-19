using LiveConfiguration.Core.Helpers;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;

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
            Type tType = typeof(T);
            ValueType tValueType = tType.GetValueType();
            if (tValueType != mValueType)
                throw new ArgumentException($"Cannot convert {mValueType} to {tValueType}.");

            if (tValueType == ValueType.Timestamp && tType == typeof(DateTime))
                return (T)Convert.ChangeType(((DateTimeOffset)mRawValue).DateTime, tType);

            if(tValueType == ValueType.Subentry)
            {
                Type rawType = mRawValue.GetType();
                List<IEntry> entries = new List<IEntry>();
                if (typeof(IEnumerable).IsAssignableFrom(rawType))
                {
                    if (rawType.GetGenericArguments()[0] == typeof(Dictionary<string, object>))
                    {
                        foreach (Dictionary<string, object> entry in (IEnumerable)mRawValue)
                            entries.Add(ValueSerializer.Deserialize(entry));

                        return (T)Convert.ChangeType(entries, tType);
                    }
                    else if (rawType.GetGenericArguments()[0] == typeof(IEntry))
                        return (T)mRawValue;
                }
                else
                    throw new ArgumentException($"Cannot convert {rawType} to Subentry.");
            }

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

        /// <summary>
        /// Sets the new raw value
        /// </summary>
        /// <param name="newValue">The new value.</param>
        public void SetValue(object newValue)
        {
            mRawValue = newValue;
        }

        /// <summary>
        /// Returns the raw value
        /// </summary>
        public object GetRawValue() => mRawValue;

        ///<inheritdoc/>
        public object GetSerialized()
        {
            throw new NotImplementedException();
        }
    }
}