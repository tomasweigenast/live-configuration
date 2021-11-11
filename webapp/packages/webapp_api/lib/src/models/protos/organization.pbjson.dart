///
//  Generated code. Do not modify.
//  source: organization.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use organizationPolicyDescriptor instead')
const OrganizationPolicy$json = const {
  '1': 'OrganizationPolicy',
  '2': const [
    const {'1': 'ORGANIZATION_MEMBER_POLICY_UNDEFINED', '2': 0},
    const {'1': 'ORGANIZATION_MEMBER_POLICY_OWNER', '2': 1},
    const {'1': 'ORGANIZATION_MEMBER_POLICY_ADMINISTRATOR', '2': 2},
    const {'1': 'ORGANIZATION_MEMBER_POLICY_EDITOR', '2': 3},
    const {'1': 'ORGANIZATION_MEMBER_POLICY_SUPERVISOR', '2': 4},
  ],
};

/// Descriptor for `OrganizationPolicy`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List organizationPolicyDescriptor = $convert.base64Decode('ChJPcmdhbml6YXRpb25Qb2xpY3kSKAokT1JHQU5JWkFUSU9OX01FTUJFUl9QT0xJQ1lfVU5ERUZJTkVEEAASJAogT1JHQU5JWkFUSU9OX01FTUJFUl9QT0xJQ1lfT1dORVIQARIsCihPUkdBTklaQVRJT05fTUVNQkVSX1BPTElDWV9BRE1JTklTVFJBVE9SEAISJQohT1JHQU5JWkFUSU9OX01FTUJFUl9QT0xJQ1lfRURJVE9SEAMSKQolT1JHQU5JWkFUSU9OX01FTUJFUl9QT0xJQ1lfU1VQRVJWSVNPUhAE');
@$core.Deprecated('Use organizationDescriptor instead')
const Organization$json = const {
  '1': 'Organization',
  '2': const [
    const {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'account_uid', '3': 3, '4': 1, '5': 9, '10': 'accountUid'},
    const {'1': 'created_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'last_modified', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastModified'},
  ],
};

/// Descriptor for `Organization`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List organizationDescriptor = $convert.base64Decode('CgxPcmdhbml6YXRpb24SEAoDdWlkGAEgASgJUgN1aWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIfCgthY2NvdW50X3VpZBgDIAEoCVIKYWNjb3VudFVpZBI5CgpjcmVhdGVkX2F0GAQgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0Ej8KDWxhc3RfbW9kaWZpZWQYBSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgxsYXN0TW9kaWZpZWQ=');
@$core.Deprecated('Use organizationMemberDescriptor instead')
const OrganizationMember$json = const {
  '1': 'OrganizationMember',
  '2': const [
    const {'1': 'organization_uid', '3': 1, '4': 1, '5': 9, '10': 'organizationUid'},
    const {'1': 'account_uid', '3': 2, '4': 1, '5': 9, '10': 'accountUid'},
    const {'1': 'added_time', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'addedTime'},
    const {'1': 'policy', '3': 4, '4': 1, '5': 11, '6': '.liveconfiguration.protobuf.OrganizationMember.OrganizationMemberAccessPolicy', '10': 'policy'},
  ],
  '3': const [OrganizationMember_OrganizationMemberAccessPolicy$json],
};

@$core.Deprecated('Use organizationMemberDescriptor instead')
const OrganizationMember_OrganizationMemberAccessPolicy$json = const {
  '1': 'OrganizationMemberAccessPolicy',
  '2': const [
    const {'1': 'policy', '3': 1, '4': 1, '5': 14, '6': '.liveconfiguration.protobuf.OrganizationPolicy', '10': 'policy'},
    const {'1': 'project', '3': 2, '4': 1, '5': 11, '6': '.liveconfiguration.protobuf.OrganizationPolicyProject', '9': 0, '10': 'project'},
  ],
  '8': const [
    const {'1': 'metadata'},
  ],
};

/// Descriptor for `OrganizationMember`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List organizationMemberDescriptor = $convert.base64Decode('ChJPcmdhbml6YXRpb25NZW1iZXISKQoQb3JnYW5pemF0aW9uX3VpZBgBIAEoCVIPb3JnYW5pemF0aW9uVWlkEh8KC2FjY291bnRfdWlkGAIgASgJUgphY2NvdW50VWlkEjkKCmFkZGVkX3RpbWUYAyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUglhZGRlZFRpbWUSZQoGcG9saWN5GAQgASgLMk0ubGl2ZWNvbmZpZ3VyYXRpb24ucHJvdG9idWYuT3JnYW5pemF0aW9uTWVtYmVyLk9yZ2FuaXphdGlvbk1lbWJlckFjY2Vzc1BvbGljeVIGcG9saWN5GscBCh5Pcmdhbml6YXRpb25NZW1iZXJBY2Nlc3NQb2xpY3kSRgoGcG9saWN5GAEgASgOMi4ubGl2ZWNvbmZpZ3VyYXRpb24ucHJvdG9idWYuT3JnYW5pemF0aW9uUG9saWN5UgZwb2xpY3kSUQoHcHJvamVjdBgCIAEoCzI1LmxpdmVjb25maWd1cmF0aW9uLnByb3RvYnVmLk9yZ2FuaXphdGlvblBvbGljeVByb2plY3RIAFIHcHJvamVjdEIKCghtZXRhZGF0YQ==');
@$core.Deprecated('Use organizationPolicyProjectDescriptor instead')
const OrganizationPolicyProject$json = const {
  '1': 'OrganizationPolicyProject',
  '2': const [
    const {'1': 'project_ids', '3': 1, '4': 3, '5': 9, '10': 'projectIds'},
  ],
};

/// Descriptor for `OrganizationPolicyProject`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List organizationPolicyProjectDescriptor = $convert.base64Decode('ChlPcmdhbml6YXRpb25Qb2xpY3lQcm9qZWN0Eh8KC3Byb2plY3RfaWRzGAEgAygJUgpwcm9qZWN0SWRz');
