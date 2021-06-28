using LiveConfiguration.Core.Entry;
using LiveConfiguration.Core.Helpers;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using Xunit;

namespace LiveConfiguration.Tests
{
    public class LiveConfigurationCoreTypeConverterTests
    {
        [Fact]
        public void Test_change_types()
        {
            // Define values
            object doubleValue = (double)25.25;
            object int64Value = 1258784L;
            object dateTimeOffsetValue = DateTimeOffset.UtcNow;
            object timeSpanValue = TimeSpan.FromMinutes(15);
            object listValue = new List<double> { 15, 36, 32.254, 12.24, 12.12484, 85.287848648 };
            object mapValue = new Dictionary<string, object>
            {
                { "Text", "hi there" },
                { "TextLength", "hi there".Length },
                { "Values", new List<string> { "first", "second", "third" } },
            };

            // Test
            Record.Exception(() => TypeConverter.ConvertTo<float>(doubleValue, EntryValueType.Double));
            Record.Exception(() => TypeConverter.ConvertTo<double>(doubleValue, EntryValueType.Double));

            Assert.Throws<OverflowException>(() => TypeConverter.ConvertTo<short>(int64Value, EntryValueType.Int));
            Assert.Throws<OverflowException>(() => TypeConverter.ConvertTo<byte>(int64Value, EntryValueType.Int));
            Assert.Null(Record.Exception(() => TypeConverter.ConvertTo<int>(int64Value, EntryValueType.Int)));
            Assert.Null(Record.Exception(() => TypeConverter.ConvertTo<long>(int64Value, EntryValueType.Int)));

            Assert.Null(Record.Exception(() => TypeConverter.ConvertTo<DateTime>(dateTimeOffsetValue, EntryValueType.Date)));

            Assert.Null(Record.Exception(() => TypeConverter.ConvertTo<TimeSpan>(timeSpanValue, EntryValueType.Duration)));

            Assert.Null(Record.Exception(() => TypeConverter.ConvertTo<IEnumerable<double>>(listValue, EntryValueType.List)));

            Assert.Null(Record.Exception(() => TypeConverter.ConvertTo<IEnumerable<KeyValuePair<string, object>>>(mapValue, EntryValueType.Map)));
            Assert.Null(Record.Exception(() => TypeConverter.ConvertTo<ExampleType>(mapValue, EntryValueType.Map)));
        }

        [Fact]
        public void Test_change_type_map()
        {
            // Define values
            object mapValue = new Dictionary<string, object>
            {
                { "Text", "hi there" },
                { "TextLength", "hi there".Length },
                { "Values", new List<string> { "first", "second", "third" } },
                { "Missing", true }
            };

            // Test
            ExampleType model = TypeConverter.ConvertTo<ExampleType>(mapValue, EntryValueType.Map);
            Assert.Equal("hi there", model.Text);
            Assert.Equal("hi there".Length, model.TextLength);
            Assert.Equal(new List<string> { "first", "second", "third" }, model.Values);
        }
    }

    internal class ExampleType
    {
        [JsonProperty("text")]
        public string Text { get; set; }

        [JsonProperty("textLength")]
        public int TextLength { get; set; }

        [JsonProperty("values")]
        public List<string> Values { get; set; }
    }
}