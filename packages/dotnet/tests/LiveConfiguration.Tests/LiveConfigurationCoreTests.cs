using LiveConfiguration.Core;
using LiveConfiguration.Core.Entry;
using LiveConfiguration.Core.Exception;
using LiveConfiguration.Core.Source;
using LiveConfiguration.Memory;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Xunit;

namespace LiveConfiguration.Tests
{
    public class LiveConfigurationCoreTests
    {
        private readonly ILiveConfiguration mLiveConfiguration;

        public LiveConfigurationCoreTests()
        {
            mLiveConfiguration = LiveConfig
                .Create("mySettings")
                .WithSource(new MemoryLiveConfigurationSource(new IEntryGroup[]
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
                }))
                .Build();
        }

        [Fact]
        public void Test_entry_factory_for()
        {
            IEntry entry = EntryFactory.For<int>("intKey", "An integer", 57);
            Assert.Equal("intKey", entry.Key);
            Assert.Equal("An integer", entry.Name);
            Assert.Null(entry.Description);
        }

        [Fact]
        public void Test_entry_factory_convert()
        {
            IEntry entry = EntryFactory.For<int>("intKey", "An integer", 57);
            int value = entry.Value.As<int>();
            Assert.Equal(57, value);
            Assert.Throws<ArgumentException>(() => entry.Value.As<string>());
        }

        [Fact]
        public void Test_entry_encoding()
        {
            IEntry entry = EntryFactory.For<int>("intKey", "An integer", 57);
            Dictionary<string, object> dictionary = entry.ToDictionary();
            Assert.True(dictionary.ContainsKey("value"));

            IEntry entry2 = EntryFactory.For<Example>("example", "Example class", new Example
            {
                Text = "hola",
                TextLength = 4,
                Values = new List<string> { "first", "second", "last" }
            });
            Dictionary<string, object> dictionary2 = entry2.ToDictionary();
            Assert.True(dictionary2.ContainsKey("value"));

            IEntry entry3 = EntryFactory.For<DateTime>("dateTime", "A simple Date and Time", DateTime.Now.AddDays(-32));
            Dictionary<string, object> dictionary3 = entry3.ToDictionary();
            Assert.True(dictionary3.ContainsKey("value"));

            IEntry entry4 = EntryFactory.For<DateTimeOffset>("dateTimeOffset", "A simple Date and Time with offset", DateTimeOffset.Now.Add(new TimeSpan(-25, 45, 15)));
            Dictionary<string, object> dictionary4 = entry4.ToDictionary();
            Assert.True(dictionary4.ContainsKey("value"));

            IEntry entry5 = EntryFactory.For<TimeSpan>("timeSpan", "A simple timespan", new TimeSpan(30, -25, 45, 15));
            Dictionary<string, object> dictionary5 = entry5.ToDictionary();
            Assert.True(dictionary5.ContainsKey("value"));
        }

        [Fact]
        public void Test_entry_subentry_encoding()
        {
            IEntry entry = EntryFactory.ForSubEntry("subEntry", "A simple subentry", new IEntry[]
            {
                EntryFactory.For<int>("intValue", "An integer", 25),
                EntryFactory.For<bool>("booleanValue", "A boolean", false),
                EntryFactory.For<Example>("jsonValue", "A simple json", new Example { Text = "que tal", TextLength = 7 }),
            });

            Dictionary<string, object> dictionary = entry.ToDictionary();
            Assert.True(dictionary.ContainsKey("value"));
        }

        [Fact]
        public void Test_group_encoding()
        {
            IEntryGroup group = EntryFactory.Group("Group name", "any description", new IEntry[]
            {
                EntryFactory.For<int>("intValue", "An integer", 25),
                EntryFactory.For<bool>("booleanValue", "A boolean", false),
                EntryFactory.For<Example>("jsonValue", "A simple json", new Example { Text = "que tal", TextLength = 7 }),
            });

            Dictionary<string, object> dictionary = group.ToDictionary();
            Assert.True(dictionary.ContainsKey("name"));
            Assert.True(dictionary.ContainsKey("description"));
            Assert.True(dictionary.ContainsKey("entries"));
        }

        [Fact]
        public void Test_group_find()
        {
            IEntryGroup group = EntryFactory.Group("Group name", "any description", new IEntry[]
            {
                EntryFactory.For<int>("intValue", "An integer", 25),
                EntryFactory.For<bool>("booleanValue", "A boolean", false),
                EntryFactory.For<Example>("jsonValue", "A simple json", new Example { Text = "que tal", TextLength = 7 }),
            });

            IEntry entry = group.Find("intValue");
            IEntry entry2 = group.Find("anotherKey");

            Assert.NotNull(entry);
            Assert.Null(entry2);
        }

        [Fact]
        public async Task Test_liveConfiguration_get()
        {
            IEntry entry = await mLiveConfiguration.Group("1").Entry("indexer").GetAsync();
            IEntry entry2 = await mLiveConfiguration.Group("1").Entry("jsonExample").GetAsync();
            IEntry entry3 = await mLiveConfiguration.Group("1").Entry("subEntry").GetAsync();
            IEntry entry4 = await mLiveConfiguration.Group("1").Entry("dateTime").GetAsync();
            IEntry entry5 = await mLiveConfiguration.Group("1").Entry("timeSpan").GetAsync();

            Assert.NotNull(entry);
            Assert.NotNull(entry2);
            Assert.NotNull(entry3);
            Assert.NotNull(entry4);
            Assert.NotNull(entry5);

            Assert.Equal(new DateTime(2020, 01, 15), entry4.Value.As<DateTime>());
            Assert.Equal(TimeSpan.FromMilliseconds(120542174000), entry5.Value.As<TimeSpan>());
        }

        [Fact]
        public async Task Test_liveConfiguration_update()
        {
            EntryReference entryReference = mLiveConfiguration.Group("1").Entry("indexer");
            EntryReference entryReference2 = mLiveConfiguration.Group("1").Entry("jsonExample");
            EntryReference entryReference3 = mLiveConfiguration.Group("1").Entry("subEntry").Entry("indexer");
            EntryReference entryReference4 = mLiveConfiguration.Group("1").Entry("dateTime");
            EntryReference entryReference5 = mLiveConfiguration.Group("1").Entry("subEntry").Entry("indexEnabled");

            IEntry entry = await entryReference.GetAsync();
            IEntry entry2 = await entryReference2.GetAsync();
            IEntry entry3 = await entryReference3.GetAsync();
            IEntry entry4 = await entryReference4.GetAsync();
            IEntry entry5 = await entryReference5.GetAsync();

            await mLiveConfiguration.UpdateEntryAsync(entryReference, 52);
            await mLiveConfiguration.UpdateEntryAsync(entryReference2, new Example { Text = "nuevo texto", TextLength = 57 });
            await mLiveConfiguration.UpdateEntryAsync(entryReference3, 22);
            await Assert.ThrowsAsync<InvalidValueTypeException>(async () => await mLiveConfiguration.UpdateEntryAsync(entryReference5, "test"));
            await Assert.ThrowsAsync<InvalidValueTypeException>(async () => await mLiveConfiguration.UpdateEntryAsync(entryReference4, true));
        }
    }

    public class Example
    {
        public string Text { get; set; }

        public int TextLength { get; set; }

        public List<string> Values { get; set; }
    }
}