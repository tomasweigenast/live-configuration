import 'package:live_configuration/src/models/configuration/config_type.dart';
import 'package:live_configuration/src/type_decoder/type_decoder.dart';

class JsonTypeDecoder extends TypeDecoder<ConfigType> {
  @override
  T decode<T extends ConfigType>(ConfigType instance, Map<String, dynamic> map) {
    instance.mergeFrom(map);
    return instance as T;
  }
}