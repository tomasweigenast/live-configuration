///
//  Generated code. Do not modify.
//  source: configuration_entry.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use configurationEntryValueTypeDescriptor instead')
const ConfigurationEntryValueType$json = const {
  '1': 'ConfigurationEntryValueType',
  '2': const [
    const {'1': 'CONFIGURATION_ENTRY_VALUE_TYPE_NULL', '2': 0},
    const {'1': 'CONFIGURATION_ENTRY_VALUE_TYPE_BOOLEAN', '2': 1},
    const {'1': 'CONFIGURATION_ENTRY_VALUE_TYPE_STRING', '2': 2},
    const {'1': 'CONFIGURATION_ENTRY_VALUE_TYPE_INT', '2': 3},
    const {'1': 'CONFIGURATION_ENTRY_VALUE_TYPE_DOUBLE', '2': 4},
    const {'1': 'CONFIGURATION_ENTRY_VALUE_TYPE_TIMESTAMP', '2': 5},
    const {'1': 'CONFIGURATION_ENTRY_VALUE_TYPE_DURATION', '2': 6},
    const {'1': 'CONFIGURATION_ENTRY_VALUE_TYPE_LIST', '2': 7},
    const {'1': 'CONFIGURATION_ENTRY_VALUE_TYPE_MAP', '2': 8},
    const {'1': 'CONFIGURATION_ENTRY_VALUE_TYPE_RAW_JSON', '2': 9},
    const {'1': 'CONFIGURATION_ENTRY_VALUE_TYPE_BLOB', '2': 10},
  ],
};

/// Descriptor for `ConfigurationEntryValueType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List configurationEntryValueTypeDescriptor = $convert.base64Decode('ChtDb25maWd1cmF0aW9uRW50cnlWYWx1ZVR5cGUSJwojQ09ORklHVVJBVElPTl9FTlRSWV9WQUxVRV9UWVBFX05VTEwQABIqCiZDT05GSUdVUkFUSU9OX0VOVFJZX1ZBTFVFX1RZUEVfQk9PTEVBThABEikKJUNPTkZJR1VSQVRJT05fRU5UUllfVkFMVUVfVFlQRV9TVFJJTkcQAhImCiJDT05GSUdVUkFUSU9OX0VOVFJZX1ZBTFVFX1RZUEVfSU5UEAMSKQolQ09ORklHVVJBVElPTl9FTlRSWV9WQUxVRV9UWVBFX0RPVUJMRRAEEiwKKENPTkZJR1VSQVRJT05fRU5UUllfVkFMVUVfVFlQRV9USU1FU1RBTVAQBRIrCidDT05GSUdVUkFUSU9OX0VOVFJZX1ZBTFVFX1RZUEVfRFVSQVRJT04QBhInCiNDT05GSUdVUkFUSU9OX0VOVFJZX1ZBTFVFX1RZUEVfTElTVBAHEiYKIkNPTkZJR1VSQVRJT05fRU5UUllfVkFMVUVfVFlQRV9NQVAQCBIrCidDT05GSUdVUkFUSU9OX0VOVFJZX1ZBTFVFX1RZUEVfUkFXX0pTT04QCRInCiNDT05GSUdVUkFUSU9OX0VOVFJZX1ZBTFVFX1RZUEVfQkxPQhAK');
@$core.Deprecated('Use configurationGroupDescriptor instead')
const ConfigurationGroup$json = const {
  '1': 'ConfigurationGroup',
  '2': const [
    const {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'description', '17': true},
    const {'1': 'created_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'modified_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'modifiedAt'},
    const {'1': 'entries_count', '3': 6, '4': 1, '5': 13, '10': 'entriesCount'},
    const {'1': 'current_version', '3': 7, '4': 1, '5': 4, '10': 'currentVersion'},
  ],
  '8': const [
    const {'1': '_description'},
  ],
};

/// Descriptor for `ConfigurationGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configurationGroupDescriptor = $convert.base64Decode('ChJDb25maWd1cmF0aW9uR3JvdXASEAoDdWlkGAEgASgJUgN1aWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIlCgtkZXNjcmlwdGlvbhgDIAEoCUgAUgtkZXNjcmlwdGlvbogBARI5CgpjcmVhdGVkX2F0GAQgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjsKC21vZGlmaWVkX2F0GAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIKbW9kaWZpZWRBdBIjCg1lbnRyaWVzX2NvdW50GAYgASgNUgxlbnRyaWVzQ291bnQSJwoPY3VycmVudF92ZXJzaW9uGAcgASgEUg5jdXJyZW50VmVyc2lvbkIOCgxfZGVzY3JpcHRpb24=');
@$core.Deprecated('Use configurationGroupVersionDescriptor instead')
const ConfigurationGroupVersion$json = const {
  '1': 'ConfigurationGroupVersion',
  '2': const [
    const {'1': 'group_uid', '3': 1, '4': 1, '5': 9, '10': 'groupUid'},
    const {'1': 'version', '3': 2, '4': 1, '5': 4, '10': 'version'},
    const {'1': 'created_at', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'publish_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'publishAt'},
  ],
};

/// Descriptor for `ConfigurationGroupVersion`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configurationGroupVersionDescriptor = $convert.base64Decode('ChlDb25maWd1cmF0aW9uR3JvdXBWZXJzaW9uEhsKCWdyb3VwX3VpZBgBIAEoCVIIZ3JvdXBVaWQSGAoHdmVyc2lvbhgCIAEoBFIHdmVyc2lvbhI5CgpjcmVhdGVkX2F0GAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjkKCnB1Ymxpc2hfYXQYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUglwdWJsaXNoQXQ=');
@$core.Deprecated('Use configurationEntryDescriptor instead')
const ConfigurationEntry$json = const {
  '1': 'ConfigurationEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'description', '17': true},
    const {'1': 'created_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'modified_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'modifiedAt'},
    const {'1': 'value', '3': 6, '4': 1, '5': 11, '6': '.liveconfiguration.protobuf.ConfigurationEntryValue', '10': 'value'},
  ],
  '8': const [
    const {'1': '_description'},
  ],
};

/// Descriptor for `ConfigurationEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configurationEntryDescriptor = $convert.base64Decode('ChJDb25maWd1cmF0aW9uRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSEgoEbmFtZRgCIAEoCVIEbmFtZRIlCgtkZXNjcmlwdGlvbhgDIAEoCUgAUgtkZXNjcmlwdGlvbogBARI5CgpjcmVhdGVkX2F0GAQgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjsKC21vZGlmaWVkX2F0GAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIKbW9kaWZpZWRBdBJJCgV2YWx1ZRgGIAEoCzIzLmxpdmVjb25maWd1cmF0aW9uLnByb3RvYnVmLkNvbmZpZ3VyYXRpb25FbnRyeVZhbHVlUgV2YWx1ZUIOCgxfZGVzY3JpcHRpb24=');
@$core.Deprecated('Use configurationEntryValueDescriptor instead')
const ConfigurationEntryValue$json = const {
  '1': 'ConfigurationEntryValue',
  '2': const [
    const {'1': 'value_type', '3': 1, '4': 1, '5': 14, '6': '.liveconfiguration.protobuf.ConfigurationEntryValueType', '10': 'valueType'},
    const {'1': 'null', '3': 2, '4': 1, '5': 11, '6': '.liveconfiguration.protobuf.ConfigurationEntryNullValue', '9': 0, '10': 'null'},
    const {'1': 'bool_value', '3': 3, '4': 1, '5': 8, '9': 0, '10': 'boolValue'},
    const {'1': 'string_value', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'stringValue'},
    const {'1': 'int_value', '3': 5, '4': 1, '5': 3, '9': 0, '10': 'intValue'},
    const {'1': 'double_value', '3': 6, '4': 1, '5': 1, '9': 0, '10': 'doubleValue'},
    const {'1': 'timestamp_value', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 0, '10': 'timestampValue'},
    const {'1': 'duration_value', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '9': 0, '10': 'durationValue'},
    const {'1': 'list_value', '3': 9, '4': 1, '5': 11, '6': '.liveconfiguration.protobuf.ConfigurationEntryListValue', '9': 0, '10': 'listValue'},
    const {'1': 'map_value', '3': 10, '4': 1, '5': 11, '6': '.liveconfiguration.protobuf.ConfigurationEntryMapValue', '9': 0, '10': 'mapValue'},
    const {'1': 'raw_json_value', '3': 11, '4': 1, '5': 9, '9': 0, '10': 'rawJsonValue'},
    const {'1': 'blob_value', '3': 12, '4': 1, '5': 12, '9': 0, '10': 'blobValue'},
  ],
  '8': const [
    const {'1': 'value'},
  ],
};

/// Descriptor for `ConfigurationEntryValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configurationEntryValueDescriptor = $convert.base64Decode('ChdDb25maWd1cmF0aW9uRW50cnlWYWx1ZRJWCgp2YWx1ZV90eXBlGAEgASgOMjcubGl2ZWNvbmZpZ3VyYXRpb24ucHJvdG9idWYuQ29uZmlndXJhdGlvbkVudHJ5VmFsdWVUeXBlUgl2YWx1ZVR5cGUSTQoEbnVsbBgCIAEoCzI3LmxpdmVjb25maWd1cmF0aW9uLnByb3RvYnVmLkNvbmZpZ3VyYXRpb25FbnRyeU51bGxWYWx1ZUgAUgRudWxsEh8KCmJvb2xfdmFsdWUYAyABKAhIAFIJYm9vbFZhbHVlEiMKDHN0cmluZ192YWx1ZRgEIAEoCUgAUgtzdHJpbmdWYWx1ZRIdCglpbnRfdmFsdWUYBSABKANIAFIIaW50VmFsdWUSIwoMZG91YmxlX3ZhbHVlGAYgASgBSABSC2RvdWJsZVZhbHVlEkUKD3RpbWVzdGFtcF92YWx1ZRgHIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIAFIOdGltZXN0YW1wVmFsdWUSQgoOZHVyYXRpb25fdmFsdWUYCCABKAsyGS5nb29nbGUucHJvdG9idWYuRHVyYXRpb25IAFINZHVyYXRpb25WYWx1ZRJYCgpsaXN0X3ZhbHVlGAkgASgLMjcubGl2ZWNvbmZpZ3VyYXRpb24ucHJvdG9idWYuQ29uZmlndXJhdGlvbkVudHJ5TGlzdFZhbHVlSABSCWxpc3RWYWx1ZRJVCgltYXBfdmFsdWUYCiABKAsyNi5saXZlY29uZmlndXJhdGlvbi5wcm90b2J1Zi5Db25maWd1cmF0aW9uRW50cnlNYXBWYWx1ZUgAUghtYXBWYWx1ZRImCg5yYXdfanNvbl92YWx1ZRgLIAEoCUgAUgxyYXdKc29uVmFsdWUSHwoKYmxvYl92YWx1ZRgMIAEoDEgAUglibG9iVmFsdWVCBwoFdmFsdWU=');
@$core.Deprecated('Use configurationEntryListValueDescriptor instead')
const ConfigurationEntryListValue$json = const {
  '1': 'ConfigurationEntryListValue',
  '2': const [
    const {'1': 'values', '3': 1, '4': 3, '5': 11, '6': '.liveconfiguration.protobuf.ConfigurationEntryValue', '10': 'values'},
  ],
};

/// Descriptor for `ConfigurationEntryListValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configurationEntryListValueDescriptor = $convert.base64Decode('ChtDb25maWd1cmF0aW9uRW50cnlMaXN0VmFsdWUSSwoGdmFsdWVzGAEgAygLMjMubGl2ZWNvbmZpZ3VyYXRpb24ucHJvdG9idWYuQ29uZmlndXJhdGlvbkVudHJ5VmFsdWVSBnZhbHVlcw==');
@$core.Deprecated('Use configurationEntryMapValueDescriptor instead')
const ConfigurationEntryMapValue$json = const {
  '1': 'ConfigurationEntryMapValue',
  '2': const [
    const {'1': 'fields', '3': 1, '4': 3, '5': 11, '6': '.liveconfiguration.protobuf.ConfigurationEntryMapValue.ConfigurationEntryMapValueField', '10': 'fields'},
  ],
  '3': const [ConfigurationEntryMapValue_ConfigurationEntryMapValueField$json],
};

@$core.Deprecated('Use configurationEntryMapValueDescriptor instead')
const ConfigurationEntryMapValue_ConfigurationEntryMapValueField$json = const {
  '1': 'ConfigurationEntryMapValueField',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.liveconfiguration.protobuf.ConfigurationEntryValue', '10': 'value'},
  ],
};

/// Descriptor for `ConfigurationEntryMapValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configurationEntryMapValueDescriptor = $convert.base64Decode('ChpDb25maWd1cmF0aW9uRW50cnlNYXBWYWx1ZRJuCgZmaWVsZHMYASADKAsyVi5saXZlY29uZmlndXJhdGlvbi5wcm90b2J1Zi5Db25maWd1cmF0aW9uRW50cnlNYXBWYWx1ZS5Db25maWd1cmF0aW9uRW50cnlNYXBWYWx1ZUZpZWxkUgZmaWVsZHMagAEKH0NvbmZpZ3VyYXRpb25FbnRyeU1hcFZhbHVlRmllbGQSEgoEbmFtZRgBIAEoCVIEbmFtZRJJCgV2YWx1ZRgCIAEoCzIzLmxpdmVjb25maWd1cmF0aW9uLnByb3RvYnVmLkNvbmZpZ3VyYXRpb25FbnRyeVZhbHVlUgV2YWx1ZQ==');
@$core.Deprecated('Use configurationEntryNullValueDescriptor instead')
const ConfigurationEntryNullValue$json = const {
  '1': 'ConfigurationEntryNullValue',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 14, '6': '.liveconfiguration.protobuf.ConfigurationEntryNullValue.ConfigurationEntryNullValueEnum', '10': 'value'},
  ],
  '4': const [ConfigurationEntryNullValue_ConfigurationEntryNullValueEnum$json],
};

@$core.Deprecated('Use configurationEntryNullValueDescriptor instead')
const ConfigurationEntryNullValue_ConfigurationEntryNullValueEnum$json = const {
  '1': 'ConfigurationEntryNullValueEnum',
  '2': const [
    const {'1': 'ConfigurationEntryNullValueEnum_NULL', '2': 0},
  ],
};

/// Descriptor for `ConfigurationEntryNullValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configurationEntryNullValueDescriptor = $convert.base64Decode('ChtDb25maWd1cmF0aW9uRW50cnlOdWxsVmFsdWUSbQoFdmFsdWUYASABKA4yVy5saXZlY29uZmlndXJhdGlvbi5wcm90b2J1Zi5Db25maWd1cmF0aW9uRW50cnlOdWxsVmFsdWUuQ29uZmlndXJhdGlvbkVudHJ5TnVsbFZhbHVlRW51bVIFdmFsdWUiSwofQ29uZmlndXJhdGlvbkVudHJ5TnVsbFZhbHVlRW51bRIoCiRDb25maWd1cmF0aW9uRW50cnlOdWxsVmFsdWVFbnVtX05VTEwQAA==');
