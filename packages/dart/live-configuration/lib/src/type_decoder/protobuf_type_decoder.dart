import 'package:live_configuration/src/type_decoder/type_decoder.dart';
import 'package:protobuf/protobuf.dart';

/// [TypeDecoder] which uses Protobuf to decode files. To use this decoder, types need to inherit from [GeneratedMessage]
class ProtobufTypeDecoder extends TypeDecoder<GeneratedMessage> {
  @override
  T decode<T extends GeneratedMessage>(GeneratedMessage instance, Map<String, dynamic> map) {
    instance.mergeFromProto3Json(map);
    return instance as T;
  }
}
