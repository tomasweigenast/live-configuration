using LiveConfiguration.Core.Entry;
using Newtonsoft.Json.Linq;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;

[assembly: InternalsVisibleTo("LiveConfiguration.Tests")]

namespace LiveConfiguration.Core.Helpers
{
    internal static class TypeConverter
    {
        public static readonly Type BoolType = typeof(bool);
        public static readonly Type ByteType = typeof(byte);
        public static readonly Type Int16Type = typeof(short);
        public static readonly Type Int32Type = typeof(int);
        public static readonly Type Int64Type = typeof(long);
        public static readonly Type DoubleType = typeof(double);
        public static readonly Type DecimalType = typeof(decimal);
        public static readonly Type FloatType = typeof(float);
        public static readonly Type StringType = typeof(string);
        public static readonly Type DateTimeType = typeof(DateTime);
        public static readonly Type DateTimeOffsetType = typeof(DateTimeOffset);
        public static readonly Type TimeSpanType = typeof(TimeSpan);
        public static readonly Type EnumerableType = typeof(IEnumerable);
        public static readonly Type MapType = typeof(IEnumerable<KeyValuePair<string, object>>);

        public static T ConvertTo<T>(object value, EntryValueType valueType)
        {
            if (value is T t)
                return t;

            Type convertType = typeof(T);
            if (valueType == EntryValueType.Boolean && convertType == BoolType)
                return (T)value;

            if (valueType == EntryValueType.Double)
            {
                if (convertType == DoubleType)
                    return (T)value;
                else if (convertType == FloatType || convertType == DecimalType)
                    return (T)Convert.ChangeType(value, convertType);
                else
                    throw new ArgumentException($"Can't convert a {value.GetType()} ({valueType}) to {convertType}.");
            }

            if (valueType == EntryValueType.Int)
            {
                if (convertType == Int64Type)
                    return (T)value;
                else if (convertType == ByteType || convertType == Int16Type || convertType == Int32Type || convertType == Int64Type)
                    return (T)Convert.ChangeType(value, convertType);
                else
                    throw new ArgumentException($"Can't convert a {value.GetType()} ({valueType}) to {convertType}.");
            }

            if (valueType == EntryValueType.String && convertType == StringType)
                return (T)value;

            if (valueType == EntryValueType.Date)
            {
                if (convertType == DateTimeOffsetType)
                    return (T)value;
                else if (convertType == DateTimeType)
                    return (T)(object)((DateTimeOffset)value).UtcDateTime;
                else
                    throw new ArgumentException($"Can't convert a {value.GetType()} ({valueType}) to {convertType}.");
            }

            if (valueType == EntryValueType.Duration)
            {
                if (convertType == TimeSpanType)
                    return (T)value;
                else
                    throw new ArgumentException($"Can't convert a {value.GetType()} ({valueType}) to {convertType}.");
            }

            if(valueType == EntryValueType.List)
            {
                if (EnumerableType.IsAssignableFrom(convertType))
                    return (T)value;
                else if (convertType.IsArray)
                    throw new ArgumentException($"Can't convert a list to an array. If you need an array, convert to a IEnumerable<T> and then call the ToArray() method.");
                else
                    throw new ArgumentException($"Can't convert a {value.GetType()} ({valueType}) to {convertType}.");
            }

            if (valueType == EntryValueType.Map)
            {
                if (MapType.IsAssignableFrom(convertType))
                    return (T)value;
                else
                {
                    // Convert to custom type
                    try
                    {
                        JObject jObject = JObject.FromObject(value);
                        return jObject.ToObject<T>();
                    }
                    catch(System.Exception ex)
                    {
                        throw new ArgumentException($"Can't convert a {value.GetType()} ({valueType}) to {convertType}.", ex);
                    }
                }
            }

            throw new ArgumentException($"Can't convert a {value.GetType()} ({valueType}) to {convertType}.");
        }
    }
}