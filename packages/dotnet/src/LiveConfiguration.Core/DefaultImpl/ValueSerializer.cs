using LiveConfiguration.Core.Exception;
using LiveConfiguration.Core.Helpers;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;

namespace LiveConfiguration.Core.DefaultImpl
{
    /// <summary>
    /// Provides methods to serialize an <see cref="IEntryValue"/>
    /// </summary>
    internal static class ValueSerializer
    {
        /// <summary>
        /// Serializes an <see cref="IEntryValue"/>
        /// </summary>
        public static Dictionary<string, object> Serialize(IEntryValue value)
        {
            Dictionary<string, object> result = new Dictionary<string, object>
            {
                { "valueType", value.Type }
            };

            object rawValue = value.GetRawValue();
            switch (value.Type)
            {
                case ValueType.Int:
                    if (!(rawValue is long))
                        rawValue = Convert.ToInt64(rawValue);
                    break;

                case ValueType.Double:
                    if (!(rawValue is double))
                        rawValue = Convert.ToDouble(rawValue);
                    break;

                case ValueType.Duration:
                    if (!(rawValue is TimeSpan timeSpan))
                        throw new ArgumentException($"Cannot serialize a duration value using {rawValue}.");
                    rawValue = timeSpan.TotalMilliseconds;
                    break;

                case ValueType.Timestamp:
                    if (rawValue is DateTimeOffset dateTimeOffset)
                        rawValue = dateTimeOffset.ToString("o", CultureInfo.InvariantCulture);
                    else if (rawValue is DateTime dateTime)
                        rawValue = dateTime.ToString("o", CultureInfo.InvariantCulture);
                    else
                        throw new ArgumentException($"Cannot serialize a timestamp value using {rawValue}.");
                    break;

                case ValueType.Json:
                    rawValue = Convert.ToBase64String(Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(rawValue)));
                    break;

                case ValueType.Subentry:
                    if(!(rawValue is IEnumerable<IEntry> subEntries))
                        throw new ArgumentException($"Cannot serialize a subentry value using {rawValue}.");

                    rawValue = subEntries.Select(x => x.ToDictionary()).ToList();
                    break;
            }

            result["value"] = rawValue;
            return result;
        }

        /// <summary>
        /// Deserializes an <see cref="IEntryValue"/>
        /// </summary>
        public static IEntry Deserialize(Dictionary<string, object> dictionary)
        {
            // Get entries
            string name, description, key;
            bool isEditable, isPublic;
            Dictionary<string, object> entryValue;
            try
            {
                name = dictionary.GetValue<string>("name");
                description = dictionary.GetValue<string>("description");
                key = dictionary.GetValue<string>("key");
                entryValue = dictionary.GetValue<Dictionary<string, object>>("value");
                isEditable = dictionary.GetValue<bool>("isEditable");
                isPublic = dictionary.GetValue<bool>("isPublic");
            }
            catch (System.Exception ex)
            {
                throw new InvalidEntryException("The entry is malformed.", ex);
            }

            // Check
            if (string.IsNullOrWhiteSpace(name)) throw new InvalidEntryException("The name of the entry is required.");
            if (string.IsNullOrWhiteSpace(key)) throw new InvalidEntryException("The key of the entry is required.");
            if (entryValue == null) throw new InvalidEntryException("An empty value is not allowed.");

            ValueType valueType;
            object value;
            try
            {
                valueType = (ValueType)entryValue.GetValue<int>("valueType");
                value = entryValue.GetValue<object>("value");
            }
            catch (System.Exception ex)
            {
                throw new InvalidEntryException("Cannot parse the value of the entry.", ex);
            }

            // Parse value
            if (value == null) throw new InvalidEntryException("The value of the entry cannot be null.");
            Type objectValueType = value.GetType();
            try
            {
                switch (valueType)
                {
                    case ValueType.String:
                        value = value.ToString();
                        break;

                    case ValueType.Int:
                        value = Convert.ToInt64(value);
                        break;

                    case ValueType.Double:
                        value = Convert.ToDouble(value);
                        break;

                    case ValueType.Boolean:
                        value = Convert.ToBoolean(value);
                        break;

                    case ValueType.Timestamp:
                        value = GetTimestamp(value);
                        break;

                    case ValueType.Duration:
                        value = GetDuration(value);
                        break;

                    case ValueType.Json:
                        value = GetJson(value);
                        break;

                    case ValueType.Subentry:
                        try
                        {
                            List<Dictionary<string, object>> subEntryGroup = new List<Dictionary<string, object>>();
                            foreach(object entry in (IEnumerable<object>)value)
                                subEntryGroup.Add((Dictionary<string, object>)entry);

                            value = subEntryGroup;
                        }
                        catch (System.Exception ex)
                        {
                            throw new InvalidValueTypeException($"Cannot parse a subentry value using: ${value}", ex);
                        }
                        break;
                }
            }
            catch (System.Exception ex)
            {
                throw new InvalidValueTypeException($"Cannot parse {valueType} to {objectValueType.FullName}.", ex);
            }

            return new Entry(key, name, description, isEditable, isPublic, new EntryValue(valueType, value));
        }

        /// <summary>
        /// Converts a timestamp value to a <see cref="DateTimeOffset"/>
        /// </summary>
        private static object GetTimestamp(object value)
        {
            if (value is string input && DateTimeOffset.TryParseExact(input, "o", CultureInfo.InvariantCulture, DateTimeStyles.None, out DateTimeOffset result))
                return result;
            else
                throw new InvalidValueTypeException($"Cannot parse a timestamp value using: {value}.");
        }

        /// <summary>
        /// Converts a duration value to a <see cref="TimeSpan"/>
        /// </summary>
        private static object GetDuration(object value)
        {
            try
            {
                double input = (double)value;
                return TimeSpan.FromMilliseconds(input);
            }
            catch (System.Exception ex)
            {
                throw new InvalidValueTypeException($"Cannot parse a duration value using: {value}.", ex);
            }
        }

        /// <summary>
        /// Converts a JSON value to its specific type
        /// </summary>
        private static object GetJson(object value)
        {
            try
            {
                string base64Input = (string)value;
                string json = Encoding.UTF8.GetString(Convert.FromBase64String(base64Input));
                return JsonConvert.DeserializeObject(json);
            }
            catch (System.Exception ex)
            {
                throw new InvalidValueTypeException($"Cannot parse a JSON value using: {value}", ex);
            }
        }
    }
}