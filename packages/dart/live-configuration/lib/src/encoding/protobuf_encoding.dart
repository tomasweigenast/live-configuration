import 'dart:typed_data';

import 'package:live_configuration/src/models/configuration/config_entry.dart';
import 'package:live_configuration/src/models/protos/google/protobuf/timestamp.pbserver.dart';
import 'package:live_configuration/src/models/protos/live_configuration.pb.dart';
import 'package:live_configuration/src/models/protos/google/protobuf/duration.pb.dart' as protobuf;
import 'package:fixnum/fixnum.dart';

class ProtobufEncoding {
  ProtobufEncoding._();

  static Iterable<ConfigEntry> decode(Uint8List buffer) {
    var entries = ConfigurationEntries.fromBuffer(buffer).entries;
    return entries.map((e) => ConfigEntry(e.key, e.valueType, _extractValue(e.value)));
  }

  static Uint8List encode(Iterable<ConfigEntry> entries) {
    var configurationEntries = ConfigurationEntries();
    for (var entry in entries) {
      configurationEntries.entries.add(ConfigurationEntry(
          key: entry.key,
          valueType: entry.valueType,
          value: _getConfigurationEntryValue(entry.value, entry.valueType)));
    }

    return configurationEntries.writeToBuffer();
  }

  static dynamic _extractValue(ConfigurationEntryValue value) {
    var valueType = value.whichKind();
    switch (valueType) {
      case ConfigurationEntryValue_Kind.boolValue:
        return value.boolValue;

      case ConfigurationEntryValue_Kind.doubleValue:
        return value.doubleValue;

      case ConfigurationEntryValue_Kind.intValue:
        return value.intValue;

      case ConfigurationEntryValue_Kind.stringValue:
        return value.stringValue;

      case ConfigurationEntryValue_Kind.durationValue:
        return Duration(
            seconds: value.durationValue.seconds.toInt(),
            microseconds: (value.durationValue.nanos / 1000).floor());

      case ConfigurationEntryValue_Kind.timestampValue:
        return value.timestampValue.toDateTime();

      case ConfigurationEntryValue_Kind.listValue:
        var values = value.listValue.values;
        return values.map((e) => _extractValue(e)).toList();

      case ConfigurationEntryValue_Kind.mapValue:
        var fields = value.mapValue.fields;
        var map = <String, dynamic>{};
        for (var field in fields.entries) {
          map[field.key] = _extractValue(field.value);
        }

        return map;

      case ConfigurationEntryValue_Kind.nullValue:
        return null;

      case ConfigurationEntryValue_Kind.bytesValue:
        return Uint8List.fromList(value.bytesValue);

      default:
        throw Exception('Invalid type $valueType');
    }
  }

  static ConfigurationEntryValue _getConfigurationEntryValue(dynamic value, ConfigurationEntryValueType valueType) {
    switch (valueType) {
      case ConfigurationEntryValueType.ConfigurationEntryValueType_BOOL:
        return ConfigurationEntryValue(boolValue: value);

      case ConfigurationEntryValueType.ConfigurationEntryValueType_DOUBLE:
        return ConfigurationEntryValue(doubleValue: value);

      case ConfigurationEntryValueType.ConfigurationEntryValueType_INT:
        return ConfigurationEntryValue(intValue: Int64(value));

      case ConfigurationEntryValueType.ConfigurationEntryValueType_STRING:
        return ConfigurationEntryValue(stringValue: value);

      case ConfigurationEntryValueType.ConfigurationEntryValueType_BYTES:
        return ConfigurationEntryValue(bytesValue: value);

      case ConfigurationEntryValueType.ConfigurationEntryValueType_DURATION:
        var duration = value as Duration;
        return ConfigurationEntryValue(
            durationValue: protobuf.Duration(
                seconds: Int64(duration.inSeconds % 60),
                nanos: (duration.inMilliseconds % 60) * 1000));

      case ConfigurationEntryValueType.ConfigurationEntryValueType_TIMESTAMP:
        return ConfigurationEntryValue(
            timestampValue: Timestamp.fromDateTime(value));

      case ConfigurationEntryValueType.ConfigurationEntryValueType_LIST:
        var iterable = value as Iterable;
        return ConfigurationEntryValue(
            listValue: ConfigurationEntryListValue(
                values: iterable.map(
                    (e) => _getConfigurationEntryValueWithoutValueType(e))));

      case ConfigurationEntryValueType.ConfigurationEntryValueType_JSON:
        return ConfigurationEntryValue(
            mapValue: ConfigurationEntryMapValue(fields: {
          for (var e in value.entries.map((e) => MapEntry(
              e.key, _getConfigurationEntryValueWithoutValueType(e.value))))
            e.key as String: e.value
        }));

      default:
        return ConfigurationEntryValue(
            nullValue: ConfigurationEntryValue_NullValue.NULL_VALUE_NULL);
    }
  }

  static ConfigurationEntryValue _getConfigurationEntryValueWithoutValueType(dynamic value) {
    if (value == null) {
      return ConfigurationEntryValue(nullValue: ConfigurationEntryValue_NullValue.NULL_VALUE_NULL);
    } else if (value is bool) {
      return ConfigurationEntryValue(boolValue: value);
    } else if (value is int) {
      return ConfigurationEntryValue(intValue: Int64(value));
    } else if (value is double) {
      return ConfigurationEntryValue(doubleValue: value);
    } else if (value is String) {
      return ConfigurationEntryValue(stringValue: value);
    } else if(value is Uint8List) {
      return ConfigurationEntryValue(bytesValue: value);
    } else if (value is Iterable) {
      return ConfigurationEntryValue(
          listValue: ConfigurationEntryListValue(
              values: value
                  .map((e) => _getConfigurationEntryValueWithoutValueType(e))));
    } else if (value is Map) {
      return ConfigurationEntryValue(
          mapValue: ConfigurationEntryMapValue(fields: {
        for (var e in value.entries.map((e) => MapEntry(
            e.key, _getConfigurationEntryValueWithoutValueType(e.value))))
          e.key as String: e.value
      }));
    } else if (value is DateTime) {
      return ConfigurationEntryValue(
          timestampValue: Timestamp.fromDateTime(value));
    } else if (value is Duration) {
      return ConfigurationEntryValue(
          durationValue: protobuf.Duration(
              seconds: Int64(value.inSeconds % 60),
              nanos: (value.inMilliseconds % 60) * 1000));
    } else {
      throw ArgumentError("Can't convert ${value.runtimeType}.");
    }
  }
}
