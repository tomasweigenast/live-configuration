using LiveConfiguration.Core;
using LiveConfiguration.Core.Base;
using LiveConfiguration.Core.Entry;
using LiveConfiguration.Core.Serializer;
using LiveConfiguration.Core.Source;
using LiveConfiguration.Memory;
using System;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;
using Xunit;

namespace LiveConfiguration.Tests
{
    public class LiveConfigurationJsonSerializerTests
    {
        private readonly ILiveConfiguration mLiveConfiguration;

        public LiveConfigurationJsonSerializerTests()
        {
            mLiveConfiguration = LiveConfigurationBuilder
                .Create()
                .WithSerializer(new JsonLiveConfigurationSerializer())
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
        public async Task Test_serialize_entry()
        {
            var group = await mLiveConfiguration.GetGroupAsync("appSettings");
            Stream serialized = await mLiveConfiguration.Serializer.SerializeAsync(new[] { group }, null);
            serialized.Position = 0;

            byte[] buffer = new byte[serialized.Length];
            serialized.Read(buffer, 0, buffer.Length);
        }
    }
}