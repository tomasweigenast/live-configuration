/// Provides methods to decode types from configuration entries.
/// [TBaseType] reffers to the base type a class must implement in order to use the current
/// decoder.
abstract class TypeDecoder<TBaseType> {
  /// The current type decoder type
  Type get type => TBaseType.runtimeType;

  /// Decodes a type
  T decode<T extends TBaseType>(TBaseType instance, Map<String, dynamic> map);
}
