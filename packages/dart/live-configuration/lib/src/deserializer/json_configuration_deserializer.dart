import 'dart:convert';
import 'dart:typed_data';

import 'package:live_configuration/src/deserializer/base_configuration_deserializer.dart';
import 'package:live_configuration/src/models/configuration/config_entry.dart';
import 'package:live_configuration/src/models/protos/live_configuration.pb.dart';

class JsonConfigurationDeserializer extends BaseConfigurationDeserializer {
  @override
  Iterable<ConfigEntry> deserialize(Uint8List buffer) {
    var jsonMap = json.decode(utf8.decode(buffer));
    var list = <ConfigEntry>[];

    for (var entry in jsonMap) {
      ConfigurationEntryValueType valueType = entry['valueType'];
      list.add(ConfigEntry(
          entry['key'], valueType, _getRealValue(entry['value'], valueType)));
    }

    return list;
  }

  @override
  String get typeCode => 'application/json';

  dynamic _getRealValue(dynamic value, ConfigurationEntryValueType valueType) {
    switch (valueType) {
      case ConfigurationEntryValueType.ConfigurationEntryValueType_TIMESTAMP:
        return DateTime.parse(value as String);

      case ConfigurationEntryValueType.ConfigurationEntryValueType_DURATION:
        return Duration(milliseconds: (value as double).floor());

      default:
        return value;
    }
  }
}
