///
//  Generated code. Do not modify.
//  source: identity.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use accountDescriptor instead')
const Account$json = const {
  '1': 'Account',
  '2': const [
    const {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'first_name', '3': 2, '4': 1, '5': 9, '10': 'firstName'},
    const {'1': 'last_name', '3': 3, '4': 1, '5': 9, '10': 'lastName'},
    const {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'phone_number', '3': 5, '4': 1, '5': 9, '9': 0, '10': 'phoneNumber', '17': true},
    const {'1': 'registration_date', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'registrationDate'},
    const {'1': 'last_modified', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastModified'},
  ],
  '8': const [
    const {'1': '_phone_number'},
  ],
};

/// Descriptor for `Account`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountDescriptor = $convert.base64Decode('CgdBY2NvdW50EhAKA3VpZBgBIAEoCVIDdWlkEh0KCmZpcnN0X25hbWUYAiABKAlSCWZpcnN0TmFtZRIbCglsYXN0X25hbWUYAyABKAlSCGxhc3ROYW1lEhQKBWVtYWlsGAQgASgJUgVlbWFpbBImCgxwaG9uZV9udW1iZXIYBSABKAlIAFILcGhvbmVOdW1iZXKIAQESRwoRcmVnaXN0cmF0aW9uX2RhdGUYBiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUhByZWdpc3RyYXRpb25EYXRlEj8KDWxhc3RfbW9kaWZpZWQYByABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgxsYXN0TW9kaWZpZWRCDwoNX3Bob25lX251bWJlcg==');
@$core.Deprecated('Use sessionDescriptor instead')
const Session$json = const {
  '1': 'Session',
  '2': const [
    const {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    const {'1': 'account_uid', '3': 2, '4': 1, '5': 9, '10': 'accountUid'},
    const {'1': 'generated_at', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'generatedAt'},
    const {'1': 'modified_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'modifiedAt'},
  ],
};

/// Descriptor for `Session`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionDescriptor = $convert.base64Decode('CgdTZXNzaW9uEhAKA3VpZBgBIAEoCVIDdWlkEh8KC2FjY291bnRfdWlkGAIgASgJUgphY2NvdW50VWlkEj0KDGdlbmVyYXRlZF9hdBgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSC2dlbmVyYXRlZEF0EjsKC21vZGlmaWVkX2F0GAQgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIKbW9kaWZpZWRBdA==');
