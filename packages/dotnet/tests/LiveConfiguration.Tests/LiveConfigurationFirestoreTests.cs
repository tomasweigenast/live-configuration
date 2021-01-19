using Grpc.Core;
using LiveConfiguration.Core;
using LiveConfiguration.Core.Entry;
using LiveConfiguration.Core.Source;
using LiveConfiguration.Firestore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Xunit;

namespace LiveConfiguration.Tests
{
    public class LiveConfigurationFirestoreTests
    {
        private readonly IEntryGroup[] mEntries = new IEntryGroup[]
        {
            EntryFactory.Group("1", "My Settings", "my awesome settings", new IEntry[]
            {
                EntryFactory.For<int>("indexer", "Indexer count", 5),
                EntryFactory.For<bool>("indexEnabled", "Index enabled", "Indicates is the index is enabled or not", true),
                EntryFactory.For<string>("magicString", "Magic String", "This is a magic string that can change"),
                EntryFactory.For<long>("longNumber", "This a really long number", long.MaxValue),
                EntryFactory.For<DateTime>("dateTime", "Date Time", new DateTime(2020, 01, 15)),
                EntryFactory.For<TimeSpan>("timeSpan", "Time", TimeSpan.FromSeconds(120542174)),
                EntryFactory.For<Example>("jsonExample", "This is an example json", new Example
                {
                    Text = "hola a todos",
                    TextLength = 25,
                    Values = new List<string> { "que", "haces", "hola", "?" }
                }),
                EntryFactory.ForSubEntry("subEntry", "Subentry value", new IEntry[]
                {
                    EntryFactory.For<int>("indexer", "Indexer count", 5),
                    EntryFactory.For<bool>("indexEnabled", "Index enabled", "Indicates is the index is enabled or not", true),
                    EntryFactory.For<string>("magicString", "Magic String", "This is a magic string that can change"),
                    EntryFactory.For<long>("longNumber", "This a really long number", long.MaxValue),
                })
            })
        };

        [Fact]
        public async Task Test_write_one()
        {
            Environment.SetEnvironmentVariable("FIRESTORE_EMULATOR_HOST", "localhost:8080");

            FirestoreConfigurationSource source = new FirestoreConfigurationSource(new FirestoreSourceOptions
            {
                CollectionName = "mySettings",
                ProjectId = "reddi-278621",
                Credentials = ChannelCredentials.Insecure
            });
            ILiveConfiguration configuration = LiveConfig
                .Create("mySettings")
                .WithSource(source)
                .Build();

            IEntry entry = mEntries.FirstOrDefault(x => x.Id == "1").Find("indexer");
            await source.WriteAsync(configuration.Group("1").Entry("indexer"), entry.ToDictionary());
        }

        [Fact]
        public async Task Test_write_many()
        {
            Environment.SetEnvironmentVariable("FIRESTORE_EMULATOR_HOST", "localhost:8080");

            FirestoreConfigurationSource source = new FirestoreConfigurationSource(new FirestoreSourceOptions
            {
                CollectionName = "mySettings",
                ProjectId = "reddi-278621",
                Credentials = ChannelCredentials.Insecure
            });
            ILiveConfiguration configuration = LiveConfig
                .Create("mySettings")
                .WithSource(source)
                .Build();

            IEntry entry = mEntries.FirstOrDefault(x => x.Id == "1").Find("indexer");
            IEntry entry2 = mEntries.FirstOrDefault(x => x.Id == "1").Find("dateTime");
            IEntry entry3 = mEntries.FirstOrDefault(x => x.Id == "1").Find("timeSpan");
            IEntry entry4 = mEntries.FirstOrDefault(x => x.Id == "1").Find("jsonExample");
            IEntry entry5 = mEntries.FirstOrDefault(x => x.Id == "1").Find("subEntry");
            await source.WriteAsync(new KeyValuePair<Dictionary<string, object>, ConfigurationReference>[]
            {
                new KeyValuePair<Dictionary<string, object>, ConfigurationReference>(entry.ToDictionary(), configuration.Group("1").Entry("indexer")),
                new KeyValuePair<Dictionary<string, object>, ConfigurationReference>(entry2.ToDictionary(), configuration.Group("1").Entry("dateTime")),
                new KeyValuePair<Dictionary<string, object>, ConfigurationReference>(entry3.ToDictionary(), configuration.Group("1").Entry("timeSpan")),
                new KeyValuePair<Dictionary<string, object>, ConfigurationReference>(entry4.ToDictionary(), configuration.Group("1").Entry("jsonExample")),
                new KeyValuePair<Dictionary<string, object>, ConfigurationReference>(entry5.ToDictionary(), configuration.Group("1").Entry("subEntry")),
            });
        }

        [Fact]
        public async Task Test_update()
        {
            Environment.SetEnvironmentVariable("FIRESTORE_EMULATOR_HOST", "localhost:8080");

            FirestoreConfigurationSource source = new FirestoreConfigurationSource(new FirestoreSourceOptions
            {
                CollectionName = "mySettings",
                ProjectId = "reddi-278621",
                Credentials = ChannelCredentials.Insecure
            });
            ILiveConfiguration configuration = LiveConfig
                .Create("mySettings")
                .WithSource(source)
                .Build();

            await configuration.UpdateEntryAsync(configuration.Group("1").Entry("subEntry").Entry("magicString"), "string mágico que cambia haha");
            await configuration.UpdateEntryAsync(configuration.Group("1").Entry("dateTime"), DateTime.Now);
            await configuration.UpdateEntryAsync(configuration.Group("1").Entry("timeSpan"), TimeSpan.FromMinutes(15));
            await configuration.UpdateEntryAsync(configuration.Group("1").Entry("jsonExample"), new Example { Text = "hola", TextLength = 54 });
        }

        [Fact]
        public async Task Test_get_entry()
        {
            Environment.SetEnvironmentVariable("FIRESTORE_EMULATOR_HOST", "localhost:8080");

            FirestoreConfigurationSource source = new FirestoreConfigurationSource(new FirestoreSourceOptions
            {
                CollectionName = "mySettings",
                ProjectId = "reddi-278621",
                Credentials = ChannelCredentials.Insecure
            });
            ILiveConfiguration configuration = LiveConfig
                .Create("mySettings")
                .WithSource(source)
                .Build();

            IEntry entry = await configuration.Group("1").Entry("jsonExample").GetAsync();
            Assert.NotNull(entry);
        }

        [Fact]
        public async Task Test_get_group()
        {
            Environment.SetEnvironmentVariable("FIRESTORE_EMULATOR_HOST", "localhost:8080");

            FirestoreConfigurationSource source = new FirestoreConfigurationSource(new FirestoreSourceOptions
            {
                CollectionName = "mySettings",
                ProjectId = "reddi-278621",
                Credentials = ChannelCredentials.Insecure
            });
            ILiveConfiguration configuration = LiveConfig
                .Create("mySettings")
                .WithSource(source)
                .Build();

            IEntryGroup group = await configuration.GetGroupAsync(configuration.Group("1"));
            Assert.NotNull(group);
        }
    }
}