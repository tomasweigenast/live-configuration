using Google.Protobuf;
using Google.Protobuf.WellKnownTypes;
using LiveConfiguration.Core;
using LiveConfiguration.Core.Entry;
using LiveConfiguration.Core.Protobuf;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using ProtobufConfigurationEntry = LiveConfiguration.Core.Protobuf.ConfigurationEntry;
using Type = System.Type;

namespace LiveConfiguration.Serializer.Protobuf
{
    internal static class ProtobufSerializerExtensions
    {
        private static readonly Type EnumerableType = typeof(IEnumerable);
        private static readonly Type DictionaryType = typeof(IEnumerable<KeyValuePair<string, object>>);
        private static readonly Type ReadOnlySpanType = typeof(ReadOnlySpan<byte>);
        private static readonly Type StreamType = typeof(Stream);

        /// <summary>
        /// Converts the current <see cref="IConfigurationEntry"/> to a <see cref="ProtobufConfigurationEntry"/>
        /// </summary>
        /// <param name="configurationEntry">The configuration entry to convert.</param>
        public static ProtobufConfigurationEntry ToEntry(this IConfigurationEntry configurationEntry)
            => new()
            {
                Key = configurationEntry.Key,
            };

        public static async Task<ConfigurationEntryValue> ToConfigurationEntryValueAsync(this object value, EntryValueType? valueType)
        {
            if (!valueType.HasValue)
                valueType = InferValueType(value);

            try
            {
                return valueType switch
                {
                    EntryValueType.Boolean => new ConfigurationEntryValue { BoolValue = (bool)value },
                    EntryValueType.Int => new ConfigurationEntryValue { IntValue = Convert.ToInt64(value) },
                    EntryValueType.Double => new ConfigurationEntryValue { DoubleValue = Convert.ToDouble(value) },
                    EntryValueType.String => new ConfigurationEntryValue { StringValue = (string)value },
                    EntryValueType.Date => new ConfigurationEntryValue { TimestampValue = ((DateTimeOffset)value).ToTimestamp() },
                    EntryValueType.Duration => new ConfigurationEntryValue { DurationValue = ((TimeSpan)value).ToDuration() },
                    EntryValueType.Map => new ConfigurationEntryValue { MapValue = await value.ToMapValueAsync() },
                    EntryValueType.List => new ConfigurationEntryValue { ListValue = await value.ToListValueAsync() },
                    EntryValueType.Bytes => new ConfigurationEntryValue { BytesValue = await value.ToBytesValueAsync() },
                    _ => throw new ArgumentException($"Cannot convert object {value.GetType()}")
                };
            }
            catch(Exception ex)
            {
                throw new ArgumentException($"Can't convert value '{value}' of type {value.GetType()} to {valueType}.", ex);
            }
        }

        public static ConfigurationEntryValueType ToConfigurationEntryValueType(this EntryValueType valueType)
            => valueType switch
            {
                EntryValueType.Boolean => ConfigurationEntryValueType.Bool,
                EntryValueType.Int => ConfigurationEntryValueType.Int,
                EntryValueType.Double => ConfigurationEntryValueType.Double,
                EntryValueType.String => ConfigurationEntryValueType.String,
                EntryValueType.Date => ConfigurationEntryValueType.Timestamp,
                EntryValueType.Duration => ConfigurationEntryValueType.Duration,
                EntryValueType.Map => ConfigurationEntryValueType.Json,
                EntryValueType.List => ConfigurationEntryValueType.List,
                _ => throw new ArgumentException($"Unknown {valueType} value type."),
            };

        private static async Task<ConfigurationEntryMapValue> ToMapValueAsync(this object obj)
        {
            var mapValue = new ConfigurationEntryMapValue();
            if (DictionaryType.IsAssignableFrom(obj.GetType()))
            {
                IEnumerable<KeyValuePair<string, object>> enumerable = (IEnumerable<KeyValuePair<string, object>>)obj;
                foreach(var entry in enumerable)
                    mapValue.Fields.Add(entry.Key.ToCamelCase(), await entry.Value.ToConfigurationEntryValueAsync(null));
            }
            else
            {
                var properties = obj.GetType().GetProperties(BindingFlags.Public);

                foreach (PropertyInfo property in properties)
                    mapValue.Fields.Add(property.Name.ToCamelCase(), await property.GetValue(obj).ToConfigurationEntryValueAsync(null));
            }

            return mapValue;
        }

        private static async Task<ConfigurationEntryListValue> ToListValueAsync(this object obj)
        {
            var enumerable = (IEnumerable)obj;
            var listValue = new ConfigurationEntryListValue();

            foreach (var item in enumerable)
                listValue.Values.Add(await item.ToConfigurationEntryValueAsync(null));

            return listValue;
        }

        private static async Task<ByteString> ToBytesValueAsync(this object obj)
        {
            ByteString result = null;
            Type objType = obj.GetType();
            try
            {
                if(objType.IsArray)
                {
                    result = ByteString.CopyFrom((byte[])obj);
                }
                else if (objType.IsAssignableFrom(ReadOnlySpanType))
                {
                    result = ByteString.CopyFrom((ReadOnlySpan<byte>)(byte[])obj);
                }
                else if (objType.IsAssignableFrom(StreamType))
                {
                    result = await ByteString.FromStreamAsync((Stream)obj);
                }

                if (result == null) throw new Exception("");
            }
            catch (Exception ex)
            {
                throw new Exception($"Cannot convert {objType} to BYTES.", ex);
            }

            return result;
        }

        private static EntryValueType InferValueType(object obj)
        {
            if (obj is string)
                return EntryValueType.String;
            else if (obj is bool)
                return EntryValueType.Boolean;
            else if (obj is double || obj is float)
                return EntryValueType.Double;
            else if (obj is byte || obj is short || obj is int || obj is long)
                return EntryValueType.Int;
            else if (obj is DateTime || obj is DateTimeOffset)
                return EntryValueType.Date;
            else if (obj is TimeSpan)
                return EntryValueType.Duration;
            else if (DictionaryType.IsAssignableFrom(obj.GetType()))
                return EntryValueType.Map;
            else
                return EntryValueType.List;
        }
    
        private static string ToCamelCase(this string input)
            => char.ToLowerInvariant(input[0]) + input[1..];
    }
}