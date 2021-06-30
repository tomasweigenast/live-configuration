import 'dart:convert';
import 'dart:typed_data';

import 'base_configuration_deserializer.dart';

/// Contains the binary information of the current configuration group
class ConfigurationBuffer {
  final Uint8List _buffer;
  final String _typeCode;

  String get typeCode => _typeCode;
  Uint8List get buffer => _buffer;

  ConfigurationBuffer._(this._buffer, this._typeCode);

  factory ConfigurationBuffer.from(Uint8List buffer) {
    var serializedTypeCode = <int>[];

    // Get delimiter type code
    var foundMagicNumbers = <int>[];
    int? lastFoundPosition;
    for (var i = 0; i < buffer.length; i++) {
      var bufferNumber = buffer[i];

      // Add found magic number only if the last stored position matches the previous one to the current
      if (BaseConfigurationDeserializer.contractNameMagicBytes
              .contains(bufferNumber) &&
          (lastFoundPosition == null || lastFoundPosition == i - 1)) {
        foundMagicNumbers.add(bufferNumber);
        lastFoundPosition = i;
      } else {
        // If its not a magic number, add to type code serialized bytes
        serializedTypeCode.add(bufferNumber);
      }

      // Break because we found all the magic numbers
      if (foundMagicNumbers.length ==
          BaseConfigurationDeserializer.contractNameMagicBytes.length) {
        break;
      }
    }

    // Convert to string using utf-8
    var typeCode = utf8.decode(Uint8List.fromList(serializedTypeCode));

    // Skip bytes and build real buffer
    buffer = Uint8List.fromList(buffer
        .skip(serializedTypeCode.length +
            BaseConfigurationDeserializer.contractNameMagicBytes.length)
        .toList());

    return ConfigurationBuffer._(Uint8List.fromList(buffer), typeCode);
  }
}
