using LiveConfiguration.Core.Helpers;
using System;
using System.Collections.Generic;

namespace LiveConfiguration.Core.Entry
{
    /// <summary>
    /// Provides methods to create <see cref="IEntry"/> and <see cref="IEntryGroup"/> instances.
    /// </summary>
    public static class EntryFactory
    {
        /// <summary>
        /// Creates a new <see cref="IEntry"/>
        /// </summary>
        /// <typeparam name="TValue">The value type to store.</typeparam>
        /// <param name="key">The key.</param>
        /// <param name="name">The name.</param>
        /// <param name="value">The intial value.</param>
        public static IEntry For<TValue>(string key, string name, TValue value)
            => For(key, name, null, value);

        /// <summary>
        /// Creates a new <see cref="IEntry"/>
        /// </summary>
        /// <typeparam name="TValue">The value type to store.</typeparam>
        /// <param name="key">The key.</param>
        /// <param name="name">The name.</param>
        /// <param name="description">The description.</param>
        /// <param name="value">The intial value.</param>
        public static IEntry For<TValue>(string key, string name, string description, TValue value)
        {
            ValueType valueType = typeof(TValue).GetValueType();
            IEntryValue entryValue = new DefaultImpl.EntryValue(valueType, value);
            DefaultImpl.Entry entry = new DefaultImpl.Entry(key, name, description, entryValue);
            return entry;
        }

        /// <summary>
        /// Creates a new <see cref="IEntry"/> which holds <see cref="ValueType.Subentry"/>
        /// </summary>
        /// <typeparam name="T">The subentries value type.</typeparam>
        /// <param name="key">The key of the entry.</param>
        /// <param name="name">The name of the entry.</param>
        /// <param name="subEntries">The subentries to add.</param>
        public static IEntry ForSubEntry(string key, string name, IEnumerable<IEntry> subEntries)
            => ForSubEntry(key, name, null, subEntries);

        /// <summary>
        /// Creates a new <see cref="IEntry"/> which holds <see cref="ValueType.Subentry"/>
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        /// <param name="name">The name of the entry.</param>
        /// <param name="description">The description of the entry.</param>
        /// <param name="subEntries">The subentries to add.</param>
        public static IEntry ForSubEntry(string key, string name, string description, IEnumerable<IEntry> subEntries)
        {
            IEntryValue entryValue = new DefaultImpl.EntryValue(ValueType.Subentry, subEntries);
            return new DefaultImpl.Entry(key, name, description, entryValue);
        }

        /// <summary>
        /// Creates a new <see cref="IEntry"/> which holds <see cref="ValueType.Subentry"/>
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        /// <param name="name">The name of the entry.</param>
        /// <param name="subEntries">The subentries to add.</param>
        public static IEntry ForSubEntry(string key, string name, Func<IEnumerable<IEntry>> subEntriesFactory)
            => ForSubEntry(key, name, null, subEntriesFactory);

        /// <summary>
        /// Creates a new <see cref="IEntry"/> which holds <see cref="ValueType.Subentry"/>
        /// </summary>
        /// <param name="key">The key of the entry.</param>
        /// <param name="name">The name of the entry.</param>
        /// <param name="description">The description of the entry.</param>
        /// <param name="subEntries">The subentries to add.</param>
        public static IEntry ForSubEntry(string key, string name, string description, Func<IEnumerable<IEntry>> subEntriesFactory)
        {
            IEnumerable<IEntry> entries = subEntriesFactory();
            IEntryValue entryValue = new DefaultImpl.EntryValue(ValueType.Subentry, entries);
            return new DefaultImpl.Entry(key, name, description, entryValue);
        }

        /// <summary>
        /// Creates a new <see cref="IEntryGroup"/>
        /// </summary>
        /// <param name="name">The name of the group.</param>
        /// <param name="description">The description of the group.</param>
        /// <param name="entries">The entries of the group.</param>
        public static IEntryGroup Group(string name, string description, IEntry[] entries)
            => new DefaultImpl.EntryGroup(null, name, description, entries);

        /// <summary>
        /// Creates a new <see cref="IEntryGroup"/>
        /// </summary>
        /// <param name="id">The id of the group.</param>
        /// <param name="name">The name of the group.</param>
        /// <param name="description">The description of the group.</param>
        /// <param name="entries">The entries of the group.</param>
        public static IEntryGroup Group(string id, string name, string description, IEntry[] entries)
            => new DefaultImpl.EntryGroup(id, name, description, entries);
    }
}