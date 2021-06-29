import 'dart:typed_data';

import 'package:live_configuration/src/deserializer/base_configuration_deserializer.dart';
import 'package:live_configuration/src/encoding/protobuf_encoding.dart';
import 'package:live_configuration/src/models/configuration/config_entry.dart';

class ProtobufConfigurationDeserializer extends BaseConfigurationDeserializer {
  
  @override
  Iterable<ConfigEntry> deserialize(Uint8List buffer) {
    return ProtobufEncoding.decode(buffer);
  }

  @override
  String get typeCode => 'application/x-protobuf';
}