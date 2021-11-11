import 'dart:typed_data';

import 'package:fixnum/fixnum.dart';
import 'package:webapp_api/src/converter/type_converter.dart';
import 'package:webapp_api/src/helpers/extensions.dart';
import 'package:webapp_api/src/models/configuration_entry/configuration_entry.dart';
import 'package:webapp_api/src/models/protos/configuration_entry.pb.dart' as pb0;
import 'package:webapp_api/src/models/protos/google/protobuf/duration.pb.dart' as pb0;

class ConfigurationGroupConverter implements TypeConverter<ConfigurationGroup, pb0.ConfigurationGroup> {
  @override
  ConfigurationGroup convertFrom(pb0.ConfigurationGroup output, TypeConverterCollection converters) {
    return ConfigurationGroup((b) => b
      ..uid = output.uid
      ..name = output.name
      ..description = output.hasDescription() ? output.description : null
      ..entriesCount = output.entriesCount
      ..currentVersion = output.currentVersion.toInt()
      ..createdAt = output.createdAt.toDateTime()
      ..modifiedAt = output.hasModifiedAt() ? output.modifiedAt.toDateTime() : null
    );
  }

  @override
  pb0.ConfigurationGroup convertTo(ConfigurationGroup input, TypeConverterCollection converters) {
    return pb0.ConfigurationGroup(
      uid: input.uid,
      name: input.name,
      description: input.description,
      createdAt: input.createdAt.toTimestamp(),
      modifiedAt: input.modifiedAt?.toTimestamp(),
      currentVersion: Int64(input.currentVersion),
      entriesCount: input.entriesCount
    );
  }
}

class ConfigurationGroupVersionConverter implements TypeConverter<ConfigurationGroupVersion, pb0.ConfigurationGroupVersion> {
  @override
  ConfigurationGroupVersion convertFrom(pb0.ConfigurationGroupVersion output, TypeConverterCollection converters) {
    return ConfigurationGroupVersion((b) => b
      ..groupUid = output.groupUid
      ..version = output.version.toInt()
      ..createdAt = output.createdAt.toDateTime()
      ..publishAt = output.hasPublishAt() ? output.publishAt.toDateTime() : null
    );
  }

  @override
  pb0.ConfigurationGroupVersion convertTo(ConfigurationGroupVersion input, TypeConverterCollection converters) {
    return pb0.ConfigurationGroupVersion(
      groupUid: input.groupUid,
      version: Int64(input.version),
      createdAt: input.createdAt.toTimestamp(),
      publishAt: input.publishAt?.toTimestamp()
    );
  }
}

class ConfigurationEntryConverter implements TypeConverter<ConfigurationEntry, pb0.ConfigurationEntry> {
  @override
  ConfigurationEntry convertFrom(pb0.ConfigurationEntry output, TypeConverterCollection converters) {
    return ConfigurationEntry((b) => b
      ..key = output.key
      ..name = output.name
      ..description = output.hasDescription() ? output.description : null
      ..createdAt = output.createdAt.toDateTime()
      ..modifiedAt = output.hasModifiedAt() ? output.modifiedAt.toDateTime() : null
      ..value = (ConfigurationEntryValueBuilder()..replace(converters.findConverter(ConfigurationEntryValue).convertFrom(output.value, converters) as ConfigurationEntryValue))
    );
  }

  @override
  pb0.ConfigurationEntry convertTo(ConfigurationEntry input, TypeConverterCollection converters) {
    return pb0.ConfigurationEntry(
      key: input.key,
      name: input.name,
      description: input.description,
      createdAt: input.createdAt.toTimestamp(),
      modifiedAt: input.modifiedAt?.toTimestamp(),
      value: converters.findConverter(ConfigurationEntryValue).convertTo(input.value, converters) as pb0.ConfigurationEntryValue,
    );
  }
}

class ConfigurationEntryValueConverter implements TypeConverter<ConfigurationEntryValue, pb0.ConfigurationEntryValue> {
  @override
  ConfigurationEntryValue convertFrom(pb0.ConfigurationEntryValue output, TypeConverterCollection converters) {
    return ConfigurationEntryValue((b) => b
      ..valueType = converters.findConverter(ConfigurationEntryValueType).convertFrom(output, converters) as ConfigurationEntryValueType
      ..value = _convertValueFrom(output)
    );
  }

  @override
  pb0.ConfigurationEntryValue convertTo(ConfigurationEntryValue input, TypeConverterCollection converters) {
    return _convertValueTo(input, converters);
  }

  pb0.ConfigurationEntryValue _convertValueTo(ConfigurationEntryValue input, TypeConverterCollection converters) {
    var valueType = converters.findConverter(ConfigurationEntryValueType).convertTo(input, converters) as pb0.ConfigurationEntryValueType;
    switch(valueType) {
      case pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_NULL:
        return pb0.ConfigurationEntryValue(valueType: valueType, null_2: pb0.ConfigurationEntryNullValue(value: pb0.ConfigurationEntryNullValue_ConfigurationEntryNullValueEnum.ConfigurationEntryNullValueEnum_NULL));

      case pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_BOOLEAN: 
        return pb0.ConfigurationEntryValue(valueType: valueType, boolValue: input.value as bool);

      case pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_STRING: 
        return pb0.ConfigurationEntryValue(valueType: valueType, stringValue: input.value as String);

      case pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_INT: 
        return pb0.ConfigurationEntryValue(valueType: valueType, intValue: Int64(input.value as int));

      case pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_DOUBLE: 
        return pb0.ConfigurationEntryValue(valueType: valueType, doubleValue: input.value as double);

      case pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_TIMESTAMP: 
        return pb0.ConfigurationEntryValue(valueType: valueType, timestampValue: (input.value as DateTime).toTimestamp());

      case pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_DURATION: 
        return pb0.ConfigurationEntryValue(valueType: valueType, durationValue: pb0.Duration(seconds: Int64((input.value as Duration).inSeconds)));

      case pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_LIST: 
        return pb0.ConfigurationEntryValue(valueType: valueType, listValue: pb0.ConfigurationEntryListValue(values: (input.value as Iterable).map((e) => _convertValueTo(e, converters))));
      
      case pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_MAP: 
        return pb0.ConfigurationEntryValue(valueType: valueType, mapValue: pb0.ConfigurationEntryMapValue(fields: (input.value as Map).entries.map((e) => pb0.ConfigurationEntryMapValue_ConfigurationEntryMapValueField(name: e.key, value: _convertValueTo(e.value, converters)))));
      
      case pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_RAW_JSON: 
        return pb0.ConfigurationEntryValue(valueType: valueType, rawJsonValue: input.value as String);
      
      case pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_BLOB: 
        return pb0.ConfigurationEntryValue(valueType: valueType, blobValue: input.value as Uint8List);

      default:
        throw Exception("Unable to convert ${input.valueType}");
    }
  }

  Object? _convertValueFrom(pb0.ConfigurationEntryValue value) {
    switch(value.valueType) {
      case pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_NULL: return null;
      case pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_BOOLEAN: return value.boolValue;
      case pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_STRING: return value.stringValue;
      case pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_INT: return value.intValue.toInt();
      case pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_DOUBLE: return value.doubleValue;
      case pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_TIMESTAMP: return value.timestampValue.toDateTime();
      case pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_DURATION: return value.durationValue.toDuration();
      case pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_LIST: return _convertListValue(value.listValue);
      case pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_MAP: return _convertMapValue(value.mapValue);
      case pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_RAW_JSON: return value.rawJsonValue;
      case pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_BLOB: return Uint8List.fromList(value.blobValue);
    }
  }

  List<Object?> _convertListValue(pb0.ConfigurationEntryListValue listValue) {
    List<Object?> values = [];
    for(var value in listValue.values) {
      values.add(_convertValueFrom(value));
    }
    return values;
  }

  Map<String, Object?> _convertMapValue(pb0.ConfigurationEntryMapValue mapValue) {
    Map<String, Object?> fields = {};
    for(var value in mapValue.fields) {
      fields[value.name] = _convertValueFrom(value.value);
    }
    return fields;
  }
}

class ConfigurationEntryValueTypeConverter implements TypeConverter<ConfigurationEntryValueType, pb0.ConfigurationEntryValueType> {
  static const Map<ConfigurationEntryValueType, pb0.ConfigurationEntryValueType> _mappedValues = {
    ConfigurationEntryValueType.nil: pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_NULL,
    ConfigurationEntryValueType.bool: pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_BOOLEAN,
    ConfigurationEntryValueType.string: pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_STRING,
    ConfigurationEntryValueType.int: pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_INT,
    ConfigurationEntryValueType.double: pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_DOUBLE,
    ConfigurationEntryValueType.timestamp: pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_TIMESTAMP,
    ConfigurationEntryValueType.duration: pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_DURATION,
    ConfigurationEntryValueType.list: pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_LIST,
    ConfigurationEntryValueType.map: pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_MAP,
    ConfigurationEntryValueType.rawJson: pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_RAW_JSON,
    ConfigurationEntryValueType.blob: pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_BLOB,
  };

  static const Map<pb0.ConfigurationEntryValueType, ConfigurationEntryValueType> _invertedValues = {
    pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_NULL: ConfigurationEntryValueType.nil,
    pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_BOOLEAN: ConfigurationEntryValueType.bool,
    pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_STRING: ConfigurationEntryValueType.string,
    pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_INT: ConfigurationEntryValueType.int,
    pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_DOUBLE: ConfigurationEntryValueType.double,
    pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_TIMESTAMP: ConfigurationEntryValueType.timestamp,
    pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_DURATION: ConfigurationEntryValueType.duration,
    pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_LIST: ConfigurationEntryValueType.list,
    pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_MAP: ConfigurationEntryValueType.map,
    pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_RAW_JSON: ConfigurationEntryValueType.rawJson,
    pb0.ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_BLOB: ConfigurationEntryValueType.blob,
  };

  @override
  ConfigurationEntryValueType convertFrom(pb0.ConfigurationEntryValueType output, TypeConverterCollection converters) {
    return _invertedValues[output]!;
  }

  @override
  pb0.ConfigurationEntryValueType convertTo(ConfigurationEntryValueType input, TypeConverterCollection converters) {
    return _mappedValues[input]!;
  }
}