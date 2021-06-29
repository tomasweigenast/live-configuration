/// Defines a method to merge a json map to build a configuration map type. 
abstract class ConfigType {

  /// Merges a map
  void mergeFrom(Map<String, dynamic> map);
}