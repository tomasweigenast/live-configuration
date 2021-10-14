class ConfigurationEntry {
  final String key;
  final String name;
  final String description;
  final String valueType;
  final Object value;

  ConfigurationEntry({required this.key, required this.name, required this.description, required this.valueType, required this.value});
}