import 'package:live_configuration/src/type_decoder/type_decoder.dart';

typedef TypeFactory = dynamic Function();

/// Contains the options to build a type decoder.
class TypeDecoderOptions {
  /// The type decoder to use
  final TypeDecoder decoder;

  /// A list of type factories
  final Map<Type, TypeFactory> typeRegistry;

  /// Creates a new [TypeDecoderOptions].
  /// [decoder] the [TypeDecoder] to use.
  /// [typeRegistry] A registry of all types to be decoded with one initialized instance.
  TypeDecoderOptions({required this.decoder, required this.typeRegistry});
}
