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
        /// <param name="name">The name of the entry.</param>
        /// <param name="description">The description to set.</param>
        /// <param name="metadata">Any metadata to add.</param>
        public static IConfigurationEntry ForBoolean(string key, bool value, string name = null, string description = null, IEnumerable<KeyValuePair<string, object>> metadata = null) 
            => For(key, value, name, description, metadata, EntryValueType.Boolean);

        /// <summary>
        /// Builds a <see cref="IConfigurationEntry"/> which holds a int value.
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        /// <param name="value">The value to set.</param>
        /// /// <param name="name">The name of the entry.</param>
        /// <param name="description">The description to set.</param>
        /// <param name="metadata">Any metadata to add.</param>
        public static IConfigurationEntry ForInt(string key, int value, string name = null, string description = null, IEnumerable<KeyValuePair<string, object>> metadata = null) 
            => For(key, value, name, description, metadata, EntryValueType.Int);

        /// <summary>
        /// Builds a <see cref="IConfigurationEntry"/> which holds a int value.
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        /// <param name="value">The value to set.</param>
        /// /// <param name="name">The name of the entry.</param>
        /// <param name="description">The description to set.</param>
        /// <param name="metadata">Any metadata to add.</param>
        public static IConfigurationEntry ForInt(string key, long value, string name = null, string description = null, IEnumerable<KeyValuePair<string, object>> metadata = null) 
            => For(key, value, name, description, metadata, EntryValueType.Int);

        /// <summary>
        /// Builds a <see cref="IConfigurationEntry"/> which holds a double value.
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        /// <param name="value">The value to set.</param>
        /// /// <param name="name">The name of the entry.</param>
        /// <param name="description">The description to set.</param>
        /// <param name="metadata">Any metadata to add.</param>
        public static IConfigurationEntry ForDouble(string key, double value, string name = null, string description = null, IEnumerable<KeyValuePair<string, object>> metadata = null) 
            => For(key, value, name, description, metadata, EntryValueType.Double);

        /// <summary>
        /// Builds a <see cref="IConfigurationEntry"/> which holds a double value.
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        /// <param name="value">The value to set.</param>
        /// /// <param name="name">The name of the entry.</param>
        /// <param name="description">The description to set.</param>
        /// <param name="metadata">Any metadata to add.</param>
        public static IConfigurationEntry ForDouble(string key, float value, string name = null, string description = null, IEnumerable<KeyValuePair<string, object>> metadata = null) 
            => For(key, value, name, description, metadata, EntryValueType.Double);

        /// <summary>
        /// Builds a <see cref="IConfigurationEntry"/> which holds a string value.
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        /// <param name="value">The value to set.</param>
        /// /// <param name="name">The name of the entry.</param>
        /// <param name="description">The description to set.</param>
        /// <param name="metadata">Any metadata to add.</param>
        public static IConfigurationEntry ForString(string key, string value, string name = null, string description = null, IEnumerable<KeyValuePair<string, object>> metadata = null) 
            => For(key, value, name, description, metadata, EntryValueType.String);

        /// <summary>
        /// Builds a <see cref="IConfigurationEntry"/> which holds a datetime value.
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        /// <param name="value">The value to set.</param>
        /// /// <param name="name">The name of the entry.</param>
        /// <param name="description">The description to set.</param>
        /// <param name="metadata">Any metadata to add.</param>
        public static IConfigurationEntry ForDateTime(string key, DateTime value, string name = null, string description = null, IEnumerable<KeyValuePair<string, object>> metadata = null) 
            => For(key, value, name, description, metadata, EntryValueType.Date);

        /// <summary>
        /// Builds a <see cref="IConfigurationEntry"/> which holds a datetime value.
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        /// <param name="value">The value to set.</param>
        /// /// <param name="name">The name of the entry.</param>
        /// <param name="description">The description to set.</param>
        /// <param name="metadata">Any metadata to add.</param>
        public static IConfigurationEntry ForDateTime(string key, DateTimeOffset value, string name = null, string description = null, IEnumerable<KeyValuePair<string, object>> metadata = null) 
            => For(key, value, name, description, metadata, EntryValueType.Date);

        /// <summary>
        /// Builds a <see cref="IConfigurationEntry"/> which holds a timespan value.
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        /// <param name="value">The value to set.</param>
        /// /// <param name="name">The name of the entry.</param>
        /// <param name="description">The description to set.</param>
        /// <param name="metadata">Any metadata to add.</param>
        public static IConfigurationEntry ForTimeSpan(string key, TimeSpan value, string name = null, string description = null, IEnumerable<KeyValuePair<string, object>> metadata = null) 
            => For(key, value, name, description, metadata, EntryValueType.Duration);

        /// <summary>
        /// Builds a <see cref="IConfigurationEntry"/> which holds a List value.
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        /// <param name="value">The value to set.</param>
        /// /// <param name="name">The name of the entry.</param>
        /// <param name="description">The description to set.</param>
        /// <param name="metadata">Any metadata to add.</param>
        public static IConfigurationEntry ForList<T>(string key, IEnumerable<T> value, string name = null, string description = null, IEnumerable<KeyValuePair<string, object>> metadata = null) 
            => For(key, value.ToList(), name, description, metadata, EntryValueType.List);

        /// <summary>
        /// Builds a <see cref="IConfigurationEntry"/> which holds a Map value.
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        /// <param name="value">The value to set.</param>
        /// /// <param name="name">The name of the entry.</param>
        /// <param name="description">The description to set.</param>
        /// <param name="metadata">Any metadata to add.</param>
        public static IConfigurationEntry ForMap(string key, IEnumerable<KeyValuePair<string, object>> value, string name = null, string description = null, IEnumerable<KeyValuePair<string, object>> metadata = null) 
            => For(key, value, name, description, metadata, EntryValueType.Map);

        /// <summary>
        /// Builds a <see cref="IConfigurationEntry"/> which holds a custom type value.
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        /// <param name="value">The value to set.</param>
        /// /// <param name="name">The name of the entry.</param>
        /// <param name="description">The description to set.</param>
        /// <param name="metadata">Any metadata to add.</param>
        public static IConfigurationEntry For<T>(string key, T value, string name = null, string description = null, IEnumerable<KeyValuePair<string, object>> metadata = null) 
            => For(key, value, name, description, metadata, EntryValueType.Map);

        private static IConfigurationEntry For(string key, object value, string name, string description, IEnumerable<KeyValuePair<string, object>> metadata, EntryValueType valueType)
            => new ConfigurationEntryImpl
            {
                Key = key,
                Name = name,
                Description = description,
                Metadata = metadata,
                RawValue = value,
                ValueType = valueType
            };
    }
}