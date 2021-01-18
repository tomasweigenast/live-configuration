using System.Collections;
using System.Collections.Generic;
using System.Linq;

namespace LiveConfiguration.Core.DefaultImpl
{
    ///<inheritdoc/>
    internal class EntryGroup : IEntryGroup
    {
        private readonly IEntry[] mEntries;

        public EntryGroup(string name, string description, IEntry[] entries)
        {
            Name = name;
            Description = description;
            mEntries = entries;
        }

        ///<inheritdoc/>
        public string Name { get; }

        ///<inheritdoc/>
        public string Description { get; }

        ///<inheritdoc/>
        public int Count => mEntries.Length;

        ///<inheritdoc/>
        public IEntry Find(string key)
            => mEntries.FirstOrDefault(x => x.Key == key);

        ///<inheritdoc/>
        public IEnumerator<IEntry> GetEnumerator()
            => (IEnumerator<IEntry>)mEntries.GetEnumerator();

        IEnumerator IEnumerable.GetEnumerator()
            => mEntries.GetEnumerator();
    }
}