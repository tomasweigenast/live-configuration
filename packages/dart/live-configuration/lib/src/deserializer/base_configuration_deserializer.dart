import 'dart:typed_data';

import 'package:live_configuration/src/models/configuration/config_entry.dart';


/// Provides methods to deserialize configuration entries from the server
abstract class BaseConfigurationDeserializer {

  static const List<int> contractNameMagicBytes = [0x15, 0x98, 0x33, 0x47];

  /// The serializer type code
  String get typeCode;

  /// Deserializes a [Uint8List] buffer
  Iterable<ConfigEntry> deserialize(Uint8List buffer);
}