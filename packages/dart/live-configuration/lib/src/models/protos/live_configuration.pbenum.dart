///
//  Generated code. Do not modify.
//  source: live_configuration.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ConfigurationEntryValueType extends $pb.ProtobufEnum {
  static const ConfigurationEntryValueType ConfigurationEntryValueType_STRING = ConfigurationEntryValueType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ConfigurationEntryValueType_STRING');
  static const ConfigurationEntryValueType ConfigurationEntryValueType_INT = ConfigurationEntryValueType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ConfigurationEntryValueType_INT');
  static const ConfigurationEntryValueType ConfigurationEntryValueType_DOUBLE = ConfigurationEntryValueType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ConfigurationEntryValueType_DOUBLE');
  static const ConfigurationEntryValueType ConfigurationEntryValueType_BOOL = ConfigurationEntryValueType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ConfigurationEntryValueType_BOOL');
  static const ConfigurationEntryValueType ConfigurationEntryValueType_LIST = ConfigurationEntryValueType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ConfigurationEntryValueType_LIST');
  static const ConfigurationEntryValueType ConfigurationEntryValueType_JSON = ConfigurationEntryValueType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ConfigurationEntryValueType_JSON');
  static const ConfigurationEntryValueType ConfigurationEntryValueType_TIMESTAMP = ConfigurationEntryValueType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ConfigurationEntryValueType_TIMESTAMP');
  static const ConfigurationEntryValueType ConfigurationEntryValueType_DURATION = ConfigurationEntryValueType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ConfigurationEntryValueType_DURATION');

  static const $core.List<ConfigurationEntryValueType> values = <ConfigurationEntryValueType> [
    ConfigurationEntryValueType_STRING,
    ConfigurationEntryValueType_INT,
    ConfigurationEntryValueType_DOUBLE,
    ConfigurationEntryValueType_BOOL,
    ConfigurationEntryValueType_LIST,
    ConfigurationEntryValueType_JSON,
    ConfigurationEntryValueType_TIMESTAMP,
    ConfigurationEntryValueType_DURATION,
  ];

  static final $core.Map<$core.int, ConfigurationEntryValueType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ConfigurationEntryValueType? valueOf($core.int value) => _byValue[value];

  const ConfigurationEntryValueType._($core.int v, $core.String n) : super(v, n);
}

class ConfigurationEntryValue_NullValue extends $pb.ProtobufEnum {
  static const ConfigurationEntryValue_NullValue NULL_VALUE_NULL = ConfigurationEntryValue_NullValue._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NULL_VALUE_NULL');

  static const $core.List<ConfigurationEntryValue_NullValue> values = <ConfigurationEntryValue_NullValue> [
    NULL_VALUE_NULL,
  ];

  static final $core.Map<$core.int, ConfigurationEntryValue_NullValue> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ConfigurationEntryValue_NullValue? valueOf($core.int value) => _byValue[value];

  const ConfigurationEntryValue_NullValue._($core.int v, $core.String n) : super(v, n);
}

