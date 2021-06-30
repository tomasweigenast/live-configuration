using Google.Protobuf.WellKnownTypes;
using LiveConfiguration.Core;
using LiveConfiguration.Core.Entry;
using LiveConfiguration.Core.Protobuf;
using System;
using System.Collections;
using System.Reflection;
using ProtobufConfigurationEntry = LiveConfiguration.Core.Protobuf.ConfigurationEntry;
using Type = System.Type;

namespace LiveConfiguration.Serializer.Protobuf
{
    internal static class ProtobufSerializerExtensions
    {
        private static readonly Type EnumerableType = typeof(IEnumerable);

        /// <summary>
        /// Converts the current <see cref="IConfigurationEntry"/> to a <see cref="ProtobufConfigurationEntry"/>
        /// </summary>
        /// <param name="configurationEntry">The configuration entry to convert.</param>
        public static ProtobufConfigurationEntry ToEntry(this IConfigurationEntry configurationEntry)
            => new()
            {
                Key = configurationEntry.Key,
            };

        public static ConfigurationEntryValue ToConfigurationEntryValue(this object value, EntryValueType? valueType)
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
                    EntryValueType.Map => new ConfigurationEntryValue { MapValue = value.ToMapValue() },
                    EntryValueType.List => new ConfigurationEntryValue { ListValue = value.ToListValue() },
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

        private static ConfigurationEntryMapValue ToMapValue(this object obj)
        {
            var properties = obj.GetType().GetProperties();
            var mapValue = new ConfigurationEntryMapValue();

            foreach (PropertyInfo property in properties)
                mapValue.Fields.Add(property.Name, property.GetValue(obj).ToConfigurationEntryValue(null));

            return mapValue;
        }

        private static ConfigurationEntryListValue ToListValue(this object obj)
        {
            var enumerable = (IEnumerable)obj;
            var listValue = new ConfigurationEntryListValue();

            foreach (var item in enumerable)
                listValue.Values.Add(item.ToConfigurationEntryValue(null));

            return listValue;
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
            else if (EnumerableType.IsAssignableFrom(obj.GetType()))
                return EntryValueType.List;
            else
                return EntryValueType.Map;
        }
    }
}