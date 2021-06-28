using LiveConfiguration.Core.Exception;
using LiveConfiguration.Core.Serializer;
using LiveConfiguration.Core.Source;
using System;
using System.Collections.Concurrent;
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

            EntryMetadata metadata = await mSource.ReadAsync(path);
            if (metadata == null)
                throw new EntryNotFoundException(path);

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

            EntryMetadata metadata = await mSource.ReadAsync(path);
            if (metadata == null)
                throw new EntryNotFoundException(path);

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