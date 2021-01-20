using LiveConfiguration.Core.Helpers;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
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
            
            // A subentry can be converted to a json representation
            if(tValueType == ValueType.Json && mValueType == ValueType.Subentry)
            {
                Type rawType = mRawValue.GetType();
                IEnumerable<IEntry> entries;

                // If its already converted, set the list
                if (mRawValue is IEnumerable<IEntry> enumerable)
                    entries = enumerable;

                // Otherwise, deserialize
                else
                {
                    entries = Deserialize();

                    IEnumerable<IEntry> Deserialize()
                    {
                        Type genericArguments = rawType.GetGenericArguments()[0];
                        if (typeof(IEnumerable).IsAssignableFrom(rawType) && genericArguments == typeof(Dictionary<string, object>))
                        {
                            foreach (Dictionary<string, object> entry in (IEnumerable)mRawValue)
                                yield return ValueSerializer.Deserialize(entry);
                        }
                    }
                }

                JObject obj = new JObject();
                foreach(IEntry entry in entries)
                    obj[entry.Key] = JToken.FromObject(entry.Value.GetRawValue());
                    
                return obj.ToObject<T>();
            }
            
            // If its another type, throw an exception
            if (tValueType != mValueType)
                throw new ArgumentException($"Cannot convert {mValueType} to {tValueType}.");

            // Convert to a DateTime
            if (tValueType == ValueType.Timestamp && tType == typeof(DateTime))
                return (T)Convert.ChangeType(((DateTimeOffset)mRawValue).DateTime, tType);

            // If its a subentry...
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

            // Convert Json if is JToken
            if(tValueType == ValueType.Json && mRawValue is JToken jToken)
                return jToken.ToObject<T>();

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