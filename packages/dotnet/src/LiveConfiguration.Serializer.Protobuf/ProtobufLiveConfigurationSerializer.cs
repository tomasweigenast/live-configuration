using Google.Protobuf;
using LiveConfiguration.Core;
using LiveConfiguration.Core.Protobuf;
using LiveConfiguration.Core.Serializer;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiveConfiguration.Serializer.Protobuf
{
    /// <summary>
    /// <see cref="ILiveConfiguration"/> serializer which uses Protobuf to serialize entries
    /// </summary>
    public class ProtobufLiveConfigurationSerializer : ILiveConfigurationSerializer
    {
        /// <inheritdoc/>
        public string ContractName => "application/x-protobuf";

        /// <inheritdoc/>
        public Stream Serialize(IEnumerable<IConfigurationGroup> configurationGroups, Func<IConfigurationGroup, bool> filter)
        {
            if (filter != null)
                configurationGroups = configurationGroups.Where(filter);

            // Parse entries
            ConfigurationEntries entries = new()
            {
                Entries =
                {
                    configurationGroups
                        .SelectMany(x => x.Entries)
                        .Select(x => new ConfigurationEntry
                        {
                            Key = x.Key,
                            ValueType = x.ValueType.ToConfigurationEntryValueType(),
                            Value = x.RawValue.ToConfigurationEntryValueAsync(x.ValueType).Result
                        })
                }
            };

            // Create writer and serialize
            byte[] contractName = Encoding.UTF8.GetBytes(ContractName);
            MemoryStream output = new();
            using (BinaryWriter writer = new(output, encoding: Encoding.UTF8, leaveOpen: true))
            {
                writer.Write(contractName);
                writer.Write(ILiveConfigurationSerializer.ContractNameMagicBytes);

                // Write protobuf
                byte[] protobufSerialized = entries.ToByteArray();
                writer.Write(protobufSerialized);
            }

            // Seek to origin
            output.Seek(0, SeekOrigin.Begin);
            return output;
        }

        /// <inheritdoc/>
        public async Task<Stream> SerializeAsync(IEnumerable<IConfigurationGroup> configurationGroups, Func<IConfigurationGroup, bool> filter)
        {
            if (filter != null)
                configurationGroups = configurationGroups.Where(filter);

            // Parse entries
            ConfigurationEntries entries = new();
            foreach(var entry in configurationGroups.SelectMany(x => x.Entries))
            {
                ConfigurationEntry configurationEntry = new()
                {
                    Key = entry.Key,
                    ValueType = entry.ValueType.ToConfigurationEntryValueType(),
                    Value = await entry.RawValue.ToConfigurationEntryValueAsync(entry.ValueType)
                };

                entries.Entries.Add(configurationEntry);
            }

            // Create writer and serialize
            byte[] contractName = Encoding.UTF8.GetBytes(ContractName);
            MemoryStream output = new();
            using (BinaryWriter writer = new(output, encoding: Encoding.UTF8, leaveOpen: true))
            {
                writer.Write(contractName);
                writer.Write(ILiveConfigurationSerializer.ContractNameMagicBytes);

                // Write protobuf
                byte[] protobufSerialized = entries.ToByteArray();
                writer.Write(protobufSerialized);
            }

            // Seek to origin
            output.Seek(0, SeekOrigin.Begin);
            return output;
        }
    }
}
