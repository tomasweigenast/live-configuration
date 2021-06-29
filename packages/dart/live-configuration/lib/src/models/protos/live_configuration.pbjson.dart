///
//  Generated code. Do not modify.
//  source: live_configuration.proto
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
    const {'1': 'ConfigurationEntryValueType_STRING', '2': 0},
    const {'1': 'ConfigurationEntryValueType_INT', '2': 1},
    const {'1': 'ConfigurationEntryValueType_DOUBLE', '2': 2},
    const {'1': 'ConfigurationEntryValueType_BOOL', '2': 3},
    const {'1': 'ConfigurationEntryValueType_LIST', '2': 4},
    const {'1': 'ConfigurationEntryValueType_JSON', '2': 5},
    const {'1': 'ConfigurationEntryValueType_TIMESTAMP', '2': 6},
    const {'1': 'ConfigurationEntryValueType_DURATION', '2': 7},
  ],
};

/// Descriptor for `ConfigurationEntryValueType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List configurationEntryValueTypeDescriptor = $convert.base64Decode('ChtDb25maWd1cmF0aW9uRW50cnlWYWx1ZVR5cGUSJgoiQ29uZmlndXJhdGlvbkVudHJ5VmFsdWVUeXBlX1NUUklORxAAEiMKH0NvbmZpZ3VyYXRpb25FbnRyeVZhbHVlVHlwZV9JTlQQARImCiJDb25maWd1cmF0aW9uRW50cnlWYWx1ZVR5cGVfRE9VQkxFEAISJAogQ29uZmlndXJhdGlvbkVudHJ5VmFsdWVUeXBlX0JPT0wQAxIkCiBDb25maWd1cmF0aW9uRW50cnlWYWx1ZVR5cGVfTElTVBAEEiQKIENvbmZpZ3VyYXRpb25FbnRyeVZhbHVlVHlwZV9KU09OEAUSKQolQ29uZmlndXJhdGlvbkVudHJ5VmFsdWVUeXBlX1RJTUVTVEFNUBAGEigKJENvbmZpZ3VyYXRpb25FbnRyeVZhbHVlVHlwZV9EVVJBVElPThAH');
@$core.Deprecated('Use configurationEntriesDescriptor instead')
const ConfigurationEntries$json = const {
  '1': 'ConfigurationEntries',
  '2': const [
    const {'1': 'entries', '3': 1, '4': 3, '5': 11, '6': '.liveconfiguration.protobuf.ConfigurationEntry', '10': 'entries'},
  ],
};

/// Descriptor for `ConfigurationEntries`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configurationEntriesDescriptor = $convert.base64Decode('ChRDb25maWd1cmF0aW9uRW50cmllcxJICgdlbnRyaWVzGAEgAygLMi4ubGl2ZWNvbmZpZ3VyYXRpb24ucHJvdG9idWYuQ29uZmlndXJhdGlvbkVudHJ5UgdlbnRyaWVz');
@$core.Deprecated('Use configurationEntryDescriptor instead')
const ConfigurationEntry$json = const {
  '1': 'ConfigurationEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value_type', '3': 2, '4': 1, '5': 14, '6': '.liveconfiguration.protobuf.ConfigurationEntryValueType', '10': 'valueType'},
    const {'1': 'value', '3': 3, '4': 1, '5': 11, '6': '.liveconfiguration.protobuf.ConfigurationEntryValue', '10': 'value'},
  ],
};

/// Descriptor for `ConfigurationEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configurationEntryDescriptor = $convert.base64Decode('ChJDb25maWd1cmF0aW9uRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSVgoKdmFsdWVfdHlwZRgCIAEoDjI3LmxpdmVjb25maWd1cmF0aW9uLnByb3RvYnVmLkNvbmZpZ3VyYXRpb25FbnRyeVZhbHVlVHlwZVIJdmFsdWVUeXBlEkkKBXZhbHVlGAMgASgLMjMubGl2ZWNvbmZpZ3VyYXRpb24ucHJvdG9idWYuQ29uZmlndXJhdGlvbkVudHJ5VmFsdWVSBXZhbHVl');
@$core.Deprecated('Use configurationEntryValueDescriptor instead')
const ConfigurationEntryValue$json = const {
  '1': 'ConfigurationEntryValue',
  '2': const [
    const {'1': 'null_value', '3': 1, '4': 1, '5': 14, '6': '.liveconfiguration.protobuf.ConfigurationEntryValue.NullValue', '9': 0, '10': 'nullValue'},
    const {'1': 'string_value', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'stringValue'},
    const {'1': 'int_value', '3': 3, '4': 1, '5': 3, '9': 0, '10': 'intValue'},
    const {'1': 'double_value', '3': 4, '4': 1, '5': 1, '9': 0, '10': 'doubleValue'},
    const {'1': 'bool_value', '3': 5, '4': 1, '5': 8, '9': 0, '10': 'boolValue'},
    const {'1': 'list_value', '3': 6, '4': 1, '5': 11, '6': '.liveconfiguration.protobuf.ConfigurationEntryListValue', '9': 0, '10': 'listValue'},
    const {'1': 'map_value', '3': 7, '4': 1, '5': 11, '6': '.liveconfiguration.protobuf.ConfigurationEntryMapValue', '9': 0, '10': 'mapValue'},
    const {'1': 'timestamp_value', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 0, '10': 'timestampValue'},
    const {'1': 'duration_value', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '9': 0, '10': 'durationValue'},
  ],
  '4': const [ConfigurationEntryValue_NullValue$json],
  '8': const [
    const {'1': 'kind'},
  ],
};

@$core.Deprecated('Use configurationEntryValueDescriptor instead')
const ConfigurationEntryValue_NullValue$json = const {
  '1': 'NullValue',
  '2': const [
    const {'1': 'NULL_VALUE_NULL', '2': 0},
  ],
};

/// Descriptor for `ConfigurationEntryValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configurationEntryValueDescriptor = $convert.base64Decode('ChdDb25maWd1cmF0aW9uRW50cnlWYWx1ZRJeCgpudWxsX3ZhbHVlGAEgASgOMj0ubGl2ZWNvbmZpZ3VyYXRpb24ucHJvdG9idWYuQ29uZmlndXJhdGlvbkVudHJ5VmFsdWUuTnVsbFZhbHVlSABSCW51bGxWYWx1ZRIjCgxzdHJpbmdfdmFsdWUYAiABKAlIAFILc3RyaW5nVmFsdWUSHQoJaW50X3ZhbHVlGAMgASgDSABSCGludFZhbHVlEiMKDGRvdWJsZV92YWx1ZRgEIAEoAUgAUgtkb3VibGVWYWx1ZRIfCgpib29sX3ZhbHVlGAUgASgISABSCWJvb2xWYWx1ZRJYCgpsaXN0X3ZhbHVlGAYgASgLMjcubGl2ZWNvbmZpZ3VyYXRpb24ucHJvdG9idWYuQ29uZmlndXJhdGlvbkVudHJ5TGlzdFZhbHVlSABSCWxpc3RWYWx1ZRJVCgltYXBfdmFsdWUYByABKAsyNi5saXZlY29uZmlndXJhdGlvbi5wcm90b2J1Zi5Db25maWd1cmF0aW9uRW50cnlNYXBWYWx1ZUgAUghtYXBWYWx1ZRJFCg90aW1lc3RhbXBfdmFsdWUYCCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSABSDnRpbWVzdGFtcFZhbHVlEkIKDmR1cmF0aW9uX3ZhbHVlGAkgASgLMhkuZ29vZ2xlLnByb3RvYnVmLkR1cmF0aW9uSABSDWR1cmF0aW9uVmFsdWUiIAoJTnVsbFZhbHVlEhMKD05VTExfVkFMVUVfTlVMTBAAQgYKBGtpbmQ=');
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
    const {'1': 'fields', '3': 1, '4': 3, '5': 11, '6': '.liveconfiguration.protobuf.ConfigurationEntryMapValue.FieldsEntry', '10': 'fields'},
  ],
  '3': const [ConfigurationEntryMapValue_FieldsEntry$json],
};

@$core.Deprecated('Use configurationEntryMapValueDescriptor instead')
const ConfigurationEntryMapValue_FieldsEntry$json = const {
  '1': 'FieldsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.liveconfiguration.protobuf.ConfigurationEntryValue', '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `ConfigurationEntryMapValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configurationEntryMapValueDescriptor = $convert.base64Decode('ChpDb25maWd1cmF0aW9uRW50cnlNYXBWYWx1ZRJaCgZmaWVsZHMYASADKAsyQi5saXZlY29uZmlndXJhdGlvbi5wcm90b2J1Zi5Db25maWd1cmF0aW9uRW50cnlNYXBWYWx1ZS5GaWVsZHNFbnRyeVIGZmllbGRzGm4KC0ZpZWxkc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EkkKBXZhbHVlGAIgASgLMjMubGl2ZWNvbmZpZ3VyYXRpb24ucHJvdG9idWYuQ29uZmlndXJhdGlvbkVudHJ5VmFsdWVSBXZhbHVlOgI4AQ==');
