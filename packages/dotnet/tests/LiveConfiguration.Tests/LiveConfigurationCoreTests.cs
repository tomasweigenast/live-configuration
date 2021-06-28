using LiveConfiguration.Core;
using LiveConfiguration.Core.Base;
using LiveConfiguration.Core.Entry;
using LiveConfiguration.Core.Source;
using LiveConfiguration.Memory;
using LiveConfiguration.Serializer.Protobuf;
using Newtonsoft.Json;
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
            mLiveConfiguration = LiveConfigurationBuilder
                .Create()
                .WithSerializer(new ProtobufLiveConfigurationSerializer())
                .WithSource(new MemoryLiveConfigurationSource(new GroupSource[]
                {
                    new GroupSource
                    {
                        Key = "appSettings",
                        Entries = new EntrySource[]
                        {
                            new EntrySource
                            {
                                Key = "shippingPrice",
                                RawValue = 25.35,
                                ValueType = EntryValueType.Double
                            },
                            new EntrySource
                            {
                                Key = "baseOrderCost",
                                RawValue = 20,
                                ValueType = EntryValueType.Double
                            },
                            new EntrySource
                            {
                                Key = "facebookEnabled",
                                RawValue = true,
                                ValueType = EntryValueType.Boolean
                            },
                            new EntrySource
                            {
                                Key = "cacheTtl",
                                RawValue = TimeSpan.FromMinutes(15),
                                ValueType = EntryValueType.Duration
                            },
                            new EntrySource
                            {
                                Key = "appTitle",
                                RawValue = "My App",
                                ValueType = EntryValueType.String
                            },
                            new EntrySource
                            {
                                Key = "example",
                                RawValue = new Example { Text = "hi", TextLength = 2, Values = new List<string> { "123", "5546", "a124d" } },
                                ValueType = EntryValueType.String
                            }
                        }
                    }
                }))
                .WithOptions(new LiveConfigurationOptions
                {
                    CacheTtl = TimeSpan.FromMinutes(5)
                })
                .Build();
        }

        [Fact]
        public async Task Test_get_entry()
        {
            Exception exception = await Record.ExceptionAsync(async () => await mLiveConfiguration.GetEntryAsync("appSettings/shippingPrice"));
            Assert.Null(exception);
        }

        [Fact]
        public async Task Test_get_non_existing_entry()
        {
            Exception exception = await Record.ExceptionAsync(async () => await mLiveConfiguration.GetEntryAsync("appSettings/notFoundEntry"));
            Assert.NotNull(exception);
        }

        [Fact]
        public async Task Test_parse_entry()
        {
            var entry1 = await mLiveConfiguration.GetEntryAsync("appSettings/shippingPrice");
            Exception exception1 = Record.Exception(() => entry1.Parse<float>());
            Assert.Null(exception1);

            var entry2 = await mLiveConfiguration.GetEntryAsync("appSettings/baseOrderCost");
            Exception exception2 = Record.Exception(() => entry2.Parse<bool>());
            Assert.NotNull(exception2);
        }
    }

    public class Example
    {
        [JsonProperty("text")]
        public string Text { get; set; }

        [JsonProperty("textLength")]
        public int TextLength { get; set; }

        [JsonProperty("values")]
        public List<string> Values { get; set; }
    }
}