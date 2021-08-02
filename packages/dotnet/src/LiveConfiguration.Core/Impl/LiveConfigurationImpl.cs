using LiveConfiguration.Core.Entry;
using LiveConfiguration.Core.Exception;
using LiveConfiguration.Core.Serializer;
using LiveConfiguration.Core.Source;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LiveConfiguration.Core.Impl
{
    internal class LiveConfigurationImpl : ILiveConfiguration
    {
        private readonly ILiveConfigurationSource mSource;
        private readonly ILiveConfigurationSerializer mSerializer;
        private readonly LiveConfigurationOptions mOptions;
        private readonly ConcurrentDictionary<string, IConfigurationGroup> mCache;

        private DateTimeOffset mCacheExpiration;

        public LiveConfigurationImpl(
            ILiveConfigurationSource source, 
            ILiveConfigurationSerializer serializer,
            LiveConfigurationOptions options)
        {
            mSource = source ?? throw new ArgumentNullException(nameof(source));
            mSerializer = serializer ?? throw new ArgumentNullException(nameof(serializer));
            mOptions = options ?? new LiveConfigurationOptions();

            if (mOptions.CacheTtl != TimeSpan.Zero)
            {
                mCache = new();
                mCacheExpiration = DateTimeOffset.UtcNow.Add(mOptions.CacheTtl);
            }
        }

        public ILiveConfigurationSerializer Serializer => mSerializer;

        public async Task CreateAsync(string path, string name, string description, EntryValueType valueType, object value, IEnumerable<KeyValuePair<string, string>> metadata)
        {
            await mSource.WriteAsync(new[]
            {
                KeyValuePair.Create(path, new EntrySource
                {
                    Name = name,
                    Description = description,
                    RawValue = value,
                    ValueType = valueType,
                    Metadata = metadata
                })
            });
        }

        public async Task UpdateAsync(string path, object value)
        {
            await mSource.WriteAsync(new[]
            {
                KeyValuePair.Create(path, new EntrySource
                {
                    RawValue = value
                })
            });
        }

        public async Task<IEnumerable<IConfigurationGroup>> GetAllAsync()
        {
            if (mOptions.CacheTtl != TimeSpan.Zero && mCacheExpiration > DateTimeOffset.UtcNow)
                return mCache.Values;

            IEnumerable<EntryMetadata> entries = await mSource.ReadAsync("*/*");
            if (entries== null)
                throw new EntryNotFoundException("*/*");

            mCacheExpiration = DateTimeOffset.UtcNow.Add(mOptions.CacheTtl);
            return entries.Select(entry => new ConfigurationGroupImpl
            {
                Key = entry.Key,
                Name = entry.Name,
                Description = entry.Description,
                Entries = (entry as GroupSource).Entries.Select(x => new ConfigurationEntryImpl
                {
                    Key = x.Key,
                    Name = x.Name,
                    Description = x.Description,
                    RawValue = x.RawValue,
                    ValueType = x.ValueType,
                    Metadata = x.Metadata
                })
            });
        }

        public async Task<IConfigurationEntry> GetEntryAsync(string path)
        {
            string[] pathParts = path.Split('/');
            IConfigurationGroup group = GetFromCache(pathParts[0]);
            if(group != null)
            {
                var entry = group.Entries.FirstOrDefault(x => x.Key == pathParts[1]);
                if (entry != null)
                    return entry;
            }

            IEnumerable<EntryMetadata> entries = await mSource.ReadAsync(path);
            if (entries == null || !entries.Any())
                throw new EntryNotFoundException(path);

            EntryMetadata metadata = entries.First();
            if (metadata is not EntrySource)
                throw new InvalidEntryException($"The entry located at '{path}' is a group, not an entry.");

            EntrySource entrySource = metadata as EntrySource;
            mCacheExpiration = DateTimeOffset.UtcNow.Add(mOptions.CacheTtl);

            return new ConfigurationEntryImpl
            {
                Key = metadata.Key,
                Name = metadata.Name,
                Description = metadata.Description,
                RawValue = entrySource.RawValue,
                ValueType = entrySource.ValueType,
                Metadata = entrySource.Metadata
            };
        }

        public async Task<IConfigurationGroup> GetGroupAsync(string path)
        {
            string groupKey = path.Split('/')[0];
            var cacheGroup = GetFromCache(groupKey);
            if (cacheGroup != null)
                return cacheGroup;

            IEnumerable<EntryMetadata> entries = await mSource.ReadAsync(path);
            if (entries == null || !entries.Any())
                throw new EntryNotFoundException(path);

            EntryMetadata metadata = entries.First();
            if (metadata is not GroupSource)
                throw new InvalidEntryException($"The entry located at '{path}' is a group, not an entry.");

            GroupSource groupSource = metadata as GroupSource;
            mCacheExpiration = DateTimeOffset.UtcNow.Add(mOptions.CacheTtl);
            return new ConfigurationGroupImpl
            {
                Key = metadata.Key,
                Name = metadata.Name,
                Description = metadata.Description,
                Entries = groupSource.Entries.Select(x => new ConfigurationEntryImpl
                {
                    Key = x.Key,
                    Name = x.Name,
                    Description = x.Description,
                    RawValue = x.RawValue,
                    ValueType = x.ValueType,
                    Metadata = x.Metadata
                })
            };
        }

        private IConfigurationGroup GetFromCache(string groupKey)
        {
            if (mOptions.CacheTtl == TimeSpan.Zero)
                return null;

            if (mCacheExpiration < DateTimeOffset.UtcNow)
                return null;

            if (mCache.TryGetValue(groupKey, out IConfigurationGroup group))
                return group;

            return null;
        }
    }
}