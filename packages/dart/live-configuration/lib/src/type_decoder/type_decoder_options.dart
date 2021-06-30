import 'package:live_configuration/src/type_decoder/type_decoder.dart';
import 'package:protobuf/protobuf.dart';

typedef TypeFactory = dynamic Function();

class TypeDecoderOptions {
  /// The type decoder to use
  final TypeDecoder decoder;

  /// A list of type factories
  final Map<Type, TypeFactory> typeRegistry;

  TypeDecoderOptions({required this.decoder, required this.typeRegistry});
}
