using LiveConfiguration.Core.Entry;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiveConfiguration.Core.Serializer
{
    /// <summary>
    /// A <see cref="ILiveConfigurationSerializer"/> which uses Json to serialize the entries
    /// </summary>
    public class JsonLiveConfigurationSerializer : ILiveConfigurationSerializer
    {
        /// <inheritdoc/>
        public string ContractName => "application/json";

        /// <inheritdoc/>
        public Stream Serialize(IEnumerable<IConfigurationGroup> configurationGroups, Func<IConfigurationGroup, bool> filter)
        {
            if (filter != null)
                configurationGroups = configurationGroups.Where(filter);

            // Parse entries
            var entries = configurationGroups
                .SelectMany(x => x.Entries)
                .Select(x => new
                {
                    Key = x.Key,
                    ValueType = x.ValueType,
                    Value = SanitizeValue(x.RawValue, x.ValueType),
                });

            // Convert to json
            string json = JsonConvert.SerializeObject(entries);

            // Create writer and serialize
            byte[] contractName = Encoding.UTF8.GetBytes(ContractName);
            MemoryStream output = new();
            using (BinaryWriter writer = new(output, encoding: Encoding.UTF8, leaveOpen: true))
            {
                writer.Write(contractName);
                writer.Write(ILiveConfigurationSerializer.ContractNameMagicBytes);

                // Write json normally
                byte[] jsonAsArray = Encoding.UTF8.GetBytes(json);
                writer.Write(jsonAsArray);
            }

            // Seek to origin
            output.Seek(0, SeekOrigin.Begin);
            return output;
        }

        /// <inheritdoc/>
        public Task<Stream> SerializeAsync(IEnumerable<IConfigurationGroup> configurationGroups, Func<IConfigurationGroup, bool> filter)
            => Task.FromResult(Serialize(configurationGroups, filter));

        #region Helpers Methods

        private static object SanitizeValue(object value, EntryValueType valueType)
            => valueType switch
            {
                EntryValueType.Date => ((DateTimeOffset)value).ToString("o", CultureInfo.InvariantCulture),
                EntryValueType.Duration => ((TimeSpan)value).TotalMilliseconds,
                _ => value
            };

        #endregion
    }
}