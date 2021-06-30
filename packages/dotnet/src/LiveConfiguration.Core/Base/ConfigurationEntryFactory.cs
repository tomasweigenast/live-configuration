using LiveConfiguration.Core.Entry;
using LiveConfiguration.Core.Impl;
using System;
using System.Collections.Generic;
using System.Linq;

namespace LiveConfiguration.Core
{
    /// <summary>
    /// Provides methods to build <see cref="IConfigurationEntry"/>s from scratch 
    /// </summary>
    public static class ConfigurationEntryFactory
    {
        /// <summary>
        /// Builds a <see cref="IConfigurationEntry"/> which holds a boolean value.
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        /// <param name="value">The value to set.</param>
        public static IConfigurationEntry ForBoolean(string key, bool value) => For(key, value, EntryValueType.Boolean);

        /// <summary>
        /// Builds a <see cref="IConfigurationEntry"/> which holds a int value.
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        /// <param name="value">The value to set.</param>
        public static IConfigurationEntry ForInt(string key, int value) => For(key, value, EntryValueType.Int);

        /// <summary>
        /// Builds a <see cref="IConfigurationEntry"/> which holds a int value.
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        /// <param name="value">The value to set.</param>
        public static IConfigurationEntry ForInt(string key, long value) => For(key, value, EntryValueType.Int);

        /// <summary>
        /// Builds a <see cref="IConfigurationEntry"/> which holds a double value.
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        /// <param name="value">The value to set.</param>
        public static IConfigurationEntry ForDouble(string key, double value) => For(key, value, EntryValueType.Double);

        /// <summary>
        /// Builds a <see cref="IConfigurationEntry"/> which holds a double value.
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        /// <param name="value">The value to set.</param>
        public static IConfigurationEntry ForDouble(string key, float value) => For(key, value, EntryValueType.Double);

        /// <summary>
        /// Builds a <see cref="IConfigurationEntry"/> which holds a string value.
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        /// <param name="value">The value to set.</param>
        public static IConfigurationEntry ForString(string key, string value) => For(key, value, EntryValueType.String);

        /// <summary>
        /// Builds a <see cref="IConfigurationEntry"/> which holds a datetime value.
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        /// <param name="value">The value to set.</param>
        public static IConfigurationEntry ForDateTime(string key, DateTime value) => For(key, value, EntryValueType.Date);

        /// <summary>
        /// Builds a <see cref="IConfigurationEntry"/> which holds a datetime value.
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        /// <param name="value">The value to set.</param>
        public static IConfigurationEntry ForDateTime(string key, DateTimeOffset value) => For(key, value, EntryValueType.Date);

        /// <summary>
        /// Builds a <see cref="IConfigurationEntry"/> which holds a timespan value.
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        /// <param name="value">The value to set.</param>
        public static IConfigurationEntry ForTimeSpan(string key, TimeSpan value) => For(key, value, EntryValueType.Duration);

        /// <summary>
        /// Builds a <see cref="IConfigurationEntry"/> which holds a List value.
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        /// <param name="value">The value to set.</param>
        public static IConfigurationEntry ForList<T>(string key, IEnumerable<T> value) => For(key, value.ToList(), EntryValueType.List);

        /// <summary>
        /// Builds a <see cref="IConfigurationEntry"/> which holds a Map value.
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        /// <param name="value">The value to set.</param>
        public static IConfigurationEntry ForMap(string key, IEnumerable<KeyValuePair<string, object>> value) => For(key, value, EntryValueType.Map);

        /// <summary>
        /// Builds a <see cref="IConfigurationEntry"/> which holds a custom type value.
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        /// <param name="value">The value to set.</param>
        public static IConfigurationEntry For<T>(string key, T value) => For(key, value, EntryValueType.Map);

        private static IConfigurationEntry For(string key, object value, EntryValueType valueType)
            => new ConfigurationEntryImpl
            {
                Key = key,
                RawValue = value,
                ValueType = valueType
            };
    }
}