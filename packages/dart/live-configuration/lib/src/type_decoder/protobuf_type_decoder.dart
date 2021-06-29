import 'package:live_configuration/src/type_decoder/type_decoder.dart';
import 'package:protobuf/protobuf.dart';

class ProtobufTypeDecoder extends TypeDecoder<GeneratedMessage> {
  
  @override
  T decode<T extends GeneratedMessage>(GeneratedMessage instance, Map<String, dynamic> map) {
    instance.mergeFromProto3Json(map);
    return instance as T;
  }

}