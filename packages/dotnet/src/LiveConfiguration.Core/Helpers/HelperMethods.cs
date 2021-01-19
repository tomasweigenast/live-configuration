using LiveConfiguration.Core.Source;
using System;
using System.Collections;
using System.Collections.Generic;

namespace LiveConfiguration.Core.Helpers
{
    internal static class HelperMethods
    {
        /// <summary>
        /// Gets the value of a dictionary, or null if its not found
        /// </summary>
        public static T GetValue<T>(this Dictionary<string, object> dictionary, string key)
        {
            if (dictionary.ContainsKey(key))
            {
                object value = dictionary[key];
                if (value == null)
                    return default;

                try
                {
                    return (T)value;
                }
                catch
                {
                    return (T)Convert.ChangeType(value, typeof(T));
                }
            }
            else
                return default;
        }

        /// <summary>
        /// Parses a chainable <see cref="ConfigurationReference"/> to a array of 
        /// strings containing the paths
        /// </summary>
        public static string[] ToStringArray(this ConfigurationReference reference)
        {
            string[] split = reference.Path.Split('/', StringSplitOptions.RemoveEmptyEntries);
            if (split.Length <= 0)
                throw new ArgumentException("Cannot parse an empty configuration reference.");

            string[] array = new string[split.Length];
            for(int i = 0; i < array.Length; i++)
            {
                string[] definitions = split[i].Split('=', StringSplitOptions.RemoveEmptyEntries);
                if (definitions.Length <= 0)
                    throw new ArgumentException("Cannot parse and invalid or empty configuration reference path.");

                array[i] = definitions[1];
            }

            return array;
        }

        public static ValueType GetValueType(this Type type)
        {
            if (type == typeof(string))
                return ValueType.String;
            else if (type == typeof(bool))
                return ValueType.Boolean;
            else if (type == typeof(int) || type == typeof(long) || type == typeof(uint) || type == typeof(ulong) || type == typeof(short) || type == typeof(ushort))
                return ValueType.Int;
            else if (type == typeof(double) || type == typeof(decimal) || type == typeof(float))
                return ValueType.Double;
            else if (type == typeof(DateTime) || type == typeof(DateTimeOffset))
                return ValueType.Timestamp;
            else if (type == typeof(TimeSpan))
                return ValueType.Duration;
            else if (typeof(IEnumerable).IsAssignableFrom(type) && type.GetGenericArguments()[0] == typeof(IEntry))
                return ValueType.Subentry;
            else
                return ValueType.Json;
        }
    }
}