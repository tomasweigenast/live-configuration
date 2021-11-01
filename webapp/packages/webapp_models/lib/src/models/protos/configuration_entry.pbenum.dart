///
//  Generated code. Do not modify.
//  source: configuration_entry.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ConfigurationEntryValueType extends $pb.ProtobufEnum {
  static const ConfigurationEntryValueType CONFIGURATION_ENTRY_VALUE_TYPE_NULL = ConfigurationEntryValueType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CONFIGURATION_ENTRY_VALUE_TYPE_NULL');
  static const ConfigurationEntryValueType CONFIGURATION_ENTRY_VALUE_TYPE_BOOLEAN = ConfigurationEntryValueType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CONFIGURATION_ENTRY_VALUE_TYPE_BOOLEAN');
  static const ConfigurationEntryValueType CONFIGURATION_ENTRY_VALUE_TYPE_STRING = ConfigurationEntryValueType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CONFIGURATION_ENTRY_VALUE_TYPE_STRING');
  static const ConfigurationEntryValueType CONFIGURATION_ENTRY_VALUE_TYPE_INT = ConfigurationEntryValueType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CONFIGURATION_ENTRY_VALUE_TYPE_INT');
  static const ConfigurationEntryValueType CONFIGURATION_ENTRY_VALUE_TYPE_DOUBLE = ConfigurationEntryValueType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CONFIGURATION_ENTRY_VALUE_TYPE_DOUBLE');
  static const ConfigurationEntryValueType CONFIGURATION_ENTRY_VALUE_TYPE_TIMESTAMP = ConfigurationEntryValueType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CONFIGURATION_ENTRY_VALUE_TYPE_TIMESTAMP');
  static const ConfigurationEntryValueType CONFIGURATION_ENTRY_VALUE_TYPE_DURATION = ConfigurationEntryValueType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CONFIGURATION_ENTRY_VALUE_TYPE_DURATION');
  static const ConfigurationEntryValueType CONFIGURATION_ENTRY_VALUE_TYPE_LIST = ConfigurationEntryValueType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CONFIGURATION_ENTRY_VALUE_TYPE_LIST');
  static const ConfigurationEntryValueType CONFIGURATION_ENTRY_VALUE_TYPE_MAP = ConfigurationEntryValueType._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CONFIGURATION_ENTRY_VALUE_TYPE_MAP');
  static const ConfigurationEntryValueType CONFIGURATION_ENTRY_VALUE_TYPE_RAW_JSON = ConfigurationEntryValueType._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CONFIGURATION_ENTRY_VALUE_TYPE_RAW_JSON');
  static const ConfigurationEntryValueType CONFIGURATION_ENTRY_VALUE_TYPE_BLOB = ConfigurationEntryValueType._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CONFIGURATION_ENTRY_VALUE_TYPE_BLOB');

  static const $core.List<ConfigurationEntryValueType> values = <ConfigurationEntryValueType> [
    CONFIGURATION_ENTRY_VALUE_TYPE_NULL,
    CONFIGURATION_ENTRY_VALUE_TYPE_BOOLEAN,
    CONFIGURATION_ENTRY_VALUE_TYPE_STRING,
    CONFIGURATION_ENTRY_VALUE_TYPE_INT,
    CONFIGURATION_ENTRY_VALUE_TYPE_DOUBLE,
    CONFIGURATION_ENTRY_VALUE_TYPE_TIMESTAMP,
    CONFIGURATION_ENTRY_VALUE_TYPE_DURATION,
    CONFIGURATION_ENTRY_VALUE_TYPE_LIST,
    CONFIGURATION_ENTRY_VALUE_TYPE_MAP,
    CONFIGURATION_ENTRY_VALUE_TYPE_RAW_JSON,
    CONFIGURATION_ENTRY_VALUE_TYPE_BLOB,
  ];

  static final $core.Map<$core.int, ConfigurationEntryValueType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ConfigurationEntryValueType? valueOf($core.int value) => _byValue[value];

  const ConfigurationEntryValueType._($core.int v, $core.String n) : super(v, n);
}

class ConfigurationEntryNullValue_ConfigurationEntryNullValueEnum extends $pb.ProtobufEnum {
  static const ConfigurationEntryNullValue_ConfigurationEntryNullValueEnum ConfigurationEntryNullValueEnum_NULL = ConfigurationEntryNullValue_ConfigurationEntryNullValueEnum._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ConfigurationEntryNullValueEnum_NULL');

  static const $core.List<ConfigurationEntryNullValue_ConfigurationEntryNullValueEnum> values = <ConfigurationEntryNullValue_ConfigurationEntryNullValueEnum> [
    ConfigurationEntryNullValueEnum_NULL,
  ];

  static final $core.Map<$core.int, ConfigurationEntryNullValue_ConfigurationEntryNullValueEnum> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ConfigurationEntryNullValue_ConfigurationEntryNullValueEnum? valueOf($core.int value) => _byValue[value];

  const ConfigurationEntryNullValue_ConfigurationEntryNullValueEnum._($core.int v, $core.String n) : super(v, n);
}

