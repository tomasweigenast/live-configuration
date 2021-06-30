import 'package:live_configuration/src/models/protos/live_configuration.pb.dart';

/// Represents a configuration entry with its value
class ConfigEntry {
  final String key;
  final ConfigurationEntryValueType valueType;
  final dynamic value;

  const ConfigEntry(this.key, this.valueType, this.value);

  factory ConfigEntry.forBool(String key, bool value) {
    return ConfigEntry(key,
        ConfigurationEntryValueType.ConfigurationEntryValueType_BOOL, value);
  }

  factory ConfigEntry.forInt(String key, int value) {
    return ConfigEntry(key,
        ConfigurationEntryValueType.ConfigurationEntryValueType_INT, value);
  }

  factory ConfigEntry.forDouble(String key, double value) {
    return ConfigEntry(key,
        ConfigurationEntryValueType.ConfigurationEntryValueType_DOUBLE, value);
  }

  factory ConfigEntry.forString(String key, String value) {
    return ConfigEntry(key,
        ConfigurationEntryValueType.ConfigurationEntryValueType_STRING, value);
  }

  factory ConfigEntry.forDateTime(String key, DateTime value) {
    return ConfigEntry(
        key,
        ConfigurationEntryValueType.ConfigurationEntryValueType_TIMESTAMP,
        value);
  }

  factory ConfigEntry.forDuration(String key, Duration value) {
    return ConfigEntry(
        key,
        ConfigurationEntryValueType.ConfigurationEntryValueType_DURATION,
        value);
  }

  factory ConfigEntry.forList(String key, List value) {
    return ConfigEntry(key,
        ConfigurationEntryValueType.ConfigurationEntryValueType_LIST, value);
  }

  factory ConfigEntry.forMap(String key, Map<String, dynamic> value) {
    return ConfigEntry(key,
        ConfigurationEntryValueType.ConfigurationEntryValueType_JSON, value);
  }
}
