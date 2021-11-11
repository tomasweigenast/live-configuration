///
//  Generated code. Do not modify.
//  source: project.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use projectDescriptor instead')
const Project$json = const {
  '1': 'Project',
  '2': const [
    const {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'organization_uid', '3': 3, '4': 1, '5': 9, '10': 'organizationUid'},
    const {'1': 'created_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'modified_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'modifiedAt'},
    const {'1': 'is_favorite', '3': 6, '4': 1, '5': 8, '10': 'isFavorite'},
  ],
};

/// Descriptor for `Project`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List projectDescriptor = $convert.base64Decode('CgdQcm9qZWN0EhAKA3VpZBgBIAEoCVIDdWlkEhIKBG5hbWUYAiABKAlSBG5hbWUSKQoQb3JnYW5pemF0aW9uX3VpZBgDIAEoCVIPb3JnYW5pemF0aW9uVWlkEjkKCmNyZWF0ZWRfYXQYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSOwoLbW9kaWZpZWRfYXQYBSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgptb2RpZmllZEF0Eh8KC2lzX2Zhdm9yaXRlGAYgASgIUgppc0Zhdm9yaXRl');
@$core.Deprecated('Use projectSettingsDescriptor instead')
const ProjectSettings$json = const {
  '1': 'ProjectSettings',
  '2': const [
    const {'1': 'enabled', '3': 1, '4': 1, '5': 8, '10': 'enabled'},
  ],
};

/// Descriptor for `ProjectSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List projectSettingsDescriptor = $convert.base64Decode('Cg9Qcm9qZWN0U2V0dGluZ3MSGAoHZW5hYmxlZBgBIAEoCFIHZW5hYmxlZA==');
@$core.Deprecated('Use projectUsageDescriptor instead')
const ProjectUsage$json = const {
  '1': 'ProjectUsage',
  '2': const [
    const {'1': 'period', '3': 1, '4': 1, '5': 11, '6': '.liveconfiguration.protobuf.Period', '10': 'period'},
    const {'1': 'total_requests', '3': 2, '4': 1, '5': 3, '10': 'totalRequests'},
    const {'1': 'requests_per_second', '3': 3, '4': 1, '5': 5, '10': 'requestsPerSecond'},
    const {'1': 'operations', '3': 4, '4': 1, '5': 11, '6': '.liveconfiguration.protobuf.ProjectUsage.Operations', '10': 'operations'},
  ],
  '3': const [ProjectUsage_Operations$json],
};

@$core.Deprecated('Use projectUsageDescriptor instead')
const ProjectUsage_Operations$json = const {
  '1': 'Operations',
  '2': const [
    const {'1': 'update_operations', '3': 1, '4': 1, '5': 5, '10': 'updateOperations'},
    const {'1': 'read_operations', '3': 2, '4': 1, '5': 5, '10': 'readOperations'},
  ],
};

/// Descriptor for `ProjectUsage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List projectUsageDescriptor = $convert.base64Decode('CgxQcm9qZWN0VXNhZ2USOgoGcGVyaW9kGAEgASgLMiIubGl2ZWNvbmZpZ3VyYXRpb24ucHJvdG9idWYuUGVyaW9kUgZwZXJpb2QSJQoOdG90YWxfcmVxdWVzdHMYAiABKANSDXRvdGFsUmVxdWVzdHMSLgoTcmVxdWVzdHNfcGVyX3NlY29uZBgDIAEoBVIRcmVxdWVzdHNQZXJTZWNvbmQSUwoKb3BlcmF0aW9ucxgEIAEoCzIzLmxpdmVjb25maWd1cmF0aW9uLnByb3RvYnVmLlByb2plY3RVc2FnZS5PcGVyYXRpb25zUgpvcGVyYXRpb25zGmIKCk9wZXJhdGlvbnMSKwoRdXBkYXRlX29wZXJhdGlvbnMYASABKAVSEHVwZGF0ZU9wZXJhdGlvbnMSJwoPcmVhZF9vcGVyYXRpb25zGAIgASgFUg5yZWFkT3BlcmF0aW9ucw==');
