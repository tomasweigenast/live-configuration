import 'package:live_configuration/src/type_decoder/type_decoder.dart';

/// [TypeDecoder] which uses JSON to decode. Types have to inherit from [ConfigType].
class JsonTypeDecoder extends TypeDecoder<ConfigType> {
  @override
  T decode<T extends ConfigType>(ConfigType instance, Map<String, dynamic> map) {
    instance.mergeFrom(map);
    return instance as T;
  }
}

/// Defines a method to merge a json map to build a configuration map type.
abstract class ConfigType {
  /// Merges a map
  void mergeFrom(Map<String, dynamic> map);
}