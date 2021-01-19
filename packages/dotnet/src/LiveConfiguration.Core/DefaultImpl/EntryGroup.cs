using LiveConfiguration.Core.Helpers;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

namespace LiveConfiguration.Core.DefaultImpl
{
    ///<inheritdoc/>
    internal class EntryGroup : IEntryGroup
    {
        private IEntry[] mEntries;

        public EntryGroup(string id, string name, string description, IEntry[] entries)
        {
            Name = name;
            Description = description;
            mEntries = entries;
            Id = id ?? IdGenerator.String();
        }

        ///<inheritdoc/>
        public string Name { get; }

        ///<inheritdoc/>
        public string Description { get; }

        ///<inheritdoc/>
        public int Count => mEntries.Length;

        ///<inheritdoc/>
        public string Id { get; }

        ///<inheritdoc/>
        public IEntry Find(string key)
        {
            if(!key.Contains('/'))
                return mEntries.FirstOrDefault(x => x.Key == key);
            else
            {
                string[] path = key.Split('/', System.StringSplitOptions.RemoveEmptyEntries);
                IEntry entry = null;
                foreach(string nested in path)
                {
                    if (entry == null)
                        entry = mEntries.FirstOrDefault(x => x.Key == nested);
                    else
                        entry = entry.Value.As<List<IEntry>>().FirstOrDefault(x => x.Key == nested);
                }

                return entry;
            }
        }

        ///<inheritdoc/>
        public IEnumerator GetEnumerator()
            => new EntryGroupEnumerator(mEntries);

        ///<inheritdoc/>
        public Dictionary<string, object> ToDictionary()
            => new Dictionary<string, object>
            {
                { "name", Name },
                { "description", Description },
                { "entries", mEntries.Select(x => x.ToDictionary()).ToList() },
                { "id", Id }
            };

        ///<inheritdoc/>
        public void Update(IEntry entry)
        {
            for(int i = 0; i < mEntries.Length; i++)
            {
                IEntry remote = mEntries[i];
                if (remote.Key == entry.Key)
                {
                    mEntries[i] = entry;
                    break;
                }
            }
        }

        IEnumerator<IEntry> IEnumerable<IEntry>.GetEnumerator()
            => (IEnumerator<IEntry>)GetEnumerator();

        private class EntryGroupEnumerator : IEnumerator
        {
            private readonly IEntry[] mEntries;
            private int mPosition = -1;

            public EntryGroupEnumerator(IEntry[] entries)
            {
                mEntries = entries;
            }

            public object Current => mEntries[mPosition];

            public bool MoveNext()
            {
                mPosition++;
                return mPosition < mEntries.Length;
            }

            public void Reset()
            {
                mPosition = -1;
            }

            private IEnumerator GetEnumerator()
                => this;
        }
    }
}