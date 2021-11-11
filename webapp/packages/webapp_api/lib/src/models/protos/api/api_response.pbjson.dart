///
//  Generated code. Do not modify.
//  source: api/api_response.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use apiResponseStatusCodeDescriptor instead')
const ApiResponseStatusCode$json = const {
  '1': 'ApiResponseStatusCode',
  '2': const [
    const {'1': 'OK', '2': 0},
    const {'1': 'CANCELLED', '2': 1},
    const {'1': 'UNKNOWN', '2': 2},
    const {'1': 'INVALID_ARGUMENT', '2': 3},
    const {'1': 'DEADLINE_EXCEEDED', '2': 4},
    const {'1': 'NOT_FOUND', '2': 5},
    const {'1': 'ALREADY_EXISTS', '2': 6},
    const {'1': 'PERMISSION_DENIED', '2': 7},
    const {'1': 'UNAUTHENTICATED', '2': 16},
    const {'1': 'RESOURCE_EXHAUSTED', '2': 8},
    const {'1': 'FAILED_PRECONDITION', '2': 9},
    const {'1': 'ABORTED', '2': 10},
    const {'1': 'OUT_OF_RANGE', '2': 11},
    const {'1': 'UNIMPLEMENTED', '2': 12},
    const {'1': 'INTERNAL', '2': 13},
    const {'1': 'UNAVAILABLE', '2': 14},
    const {'1': 'DATA_LOSS', '2': 15},
  ],
};

/// Descriptor for `ApiResponseStatusCode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List apiResponseStatusCodeDescriptor = $convert.base64Decode('ChVBcGlSZXNwb25zZVN0YXR1c0NvZGUSBgoCT0sQABINCglDQU5DRUxMRUQQARILCgdVTktOT1dOEAISFAoQSU5WQUxJRF9BUkdVTUVOVBADEhUKEURFQURMSU5FX0VYQ0VFREVEEAQSDQoJTk9UX0ZPVU5EEAUSEgoOQUxSRUFEWV9FWElTVFMQBhIVChFQRVJNSVNTSU9OX0RFTklFRBAHEhMKD1VOQVVUSEVOVElDQVRFRBAQEhYKElJFU09VUkNFX0VYSEFVU1RFRBAIEhcKE0ZBSUxFRF9QUkVDT05ESVRJT04QCRILCgdBQk9SVEVEEAoSEAoMT1VUX09GX1JBTkdFEAsSEQoNVU5JTVBMRU1FTlRFRBAMEgwKCElOVEVSTkFMEA0SDwoLVU5BVkFJTEFCTEUQDhINCglEQVRBX0xPU1MQDw==');
@$core.Deprecated('Use apiResponseDescriptor instead')
const ApiResponse$json = const {
  '1': 'ApiResponse',
  '2': const [
    const {'1': 'status_code', '3': 1, '4': 1, '5': 14, '6': '.liveconfiguration.protobuf.api.ApiResponseStatusCode', '10': 'statusCode'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'error', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'error'},
    const {'1': 'resource', '3': 4, '4': 1, '5': 11, '6': '.liveconfiguration.protobuf.api.ResourceInfo', '10': 'resource'},
  ],
};

/// Descriptor for `ApiResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List apiResponseDescriptor = $convert.base64Decode('CgtBcGlSZXNwb25zZRJWCgtzdGF0dXNfY29kZRgBIAEoDjI1LmxpdmVjb25maWd1cmF0aW9uLnByb3RvYnVmLmFwaS5BcGlSZXNwb25zZVN0YXR1c0NvZGVSCnN0YXR1c0NvZGUSGAoHbWVzc2FnZRgCIAEoCVIHbWVzc2FnZRIqCgVlcnJvchgDIAEoCzIULmdvb2dsZS5wcm90b2J1Zi5BbnlSBWVycm9yEkgKCHJlc291cmNlGAQgASgLMiwubGl2ZWNvbmZpZ3VyYXRpb24ucHJvdG9idWYuYXBpLlJlc291cmNlSW5mb1IIcmVzb3VyY2U=');
@$core.Deprecated('Use errorDetailsDescriptor instead')
const ErrorDetails$json = const {
  '1': 'ErrorDetails',
  '2': const [
    const {'1': 'reason', '3': 1, '4': 1, '5': 9, '10': 'reason'},
    const {'1': 'metadata', '3': 3, '4': 3, '5': 11, '6': '.liveconfiguration.protobuf.api.ErrorDetails.MetadataEntry', '10': 'metadata'},
  ],
  '3': const [ErrorDetails_MetadataEntry$json],
};

@$core.Deprecated('Use errorDetailsDescriptor instead')
const ErrorDetails_MetadataEntry$json = const {
  '1': 'MetadataEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `ErrorDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List errorDetailsDescriptor = $convert.base64Decode('CgxFcnJvckRldGFpbHMSFgoGcmVhc29uGAEgASgJUgZyZWFzb24SVgoIbWV0YWRhdGEYAyADKAsyOi5saXZlY29uZmlndXJhdGlvbi5wcm90b2J1Zi5hcGkuRXJyb3JEZXRhaWxzLk1ldGFkYXRhRW50cnlSCG1ldGFkYXRhGjsKDU1ldGFkYXRhRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');
@$core.Deprecated('Use badRequestDescriptor instead')
const BadRequest$json = const {
  '1': 'BadRequest',
  '2': const [
    const {'1': 'field_violations', '3': 1, '4': 3, '5': 11, '6': '.liveconfiguration.protobuf.api.BadRequest.FieldViolation', '10': 'fieldViolations'},
  ],
  '3': const [BadRequest_FieldViolation$json],
};

@$core.Deprecated('Use badRequestDescriptor instead')
const BadRequest_FieldViolation$json = const {
  '1': 'FieldViolation',
  '2': const [
    const {'1': 'field', '3': 1, '4': 1, '5': 9, '10': 'field'},
    const {'1': 'violation', '3': 2, '4': 1, '5': 9, '10': 'violation'},
  ],
};

/// Descriptor for `BadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List badRequestDescriptor = $convert.base64Decode('CgpCYWRSZXF1ZXN0EmQKEGZpZWxkX3Zpb2xhdGlvbnMYASADKAsyOS5saXZlY29uZmlndXJhdGlvbi5wcm90b2J1Zi5hcGkuQmFkUmVxdWVzdC5GaWVsZFZpb2xhdGlvblIPZmllbGRWaW9sYXRpb25zGkQKDkZpZWxkVmlvbGF0aW9uEhQKBWZpZWxkGAEgASgJUgVmaWVsZBIcCgl2aW9sYXRpb24YAiABKAlSCXZpb2xhdGlvbg==');
@$core.Deprecated('Use resourceInfoDescriptor instead')
const ResourceInfo$json = const {
  '1': 'ResourceInfo',
  '2': const [
    const {'1': 'resource_type', '3': 1, '4': 1, '5': 9, '10': 'resourceType'},
    const {'1': 'resource_name', '3': 2, '4': 1, '5': 9, '10': 'resourceName'},
  ],
};

/// Descriptor for `ResourceInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resourceInfoDescriptor = $convert.base64Decode('CgxSZXNvdXJjZUluZm8SIwoNcmVzb3VyY2VfdHlwZRgBIAEoCVIMcmVzb3VyY2VUeXBlEiMKDXJlc291cmNlX25hbWUYAiABKAlSDHJlc291cmNlTmFtZQ==');
@$core.Deprecated('Use pageDetailsDescriptor instead')
const PageDetails$json = const {
  '1': 'PageDetails',
  '2': const [
    const {'1': 'page_size', '3': 1, '4': 1, '5': 5, '10': 'pageSize'},
    const {'1': 'page_token', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'pageToken', '17': true},
  ],
  '8': const [
    const {'1': '_page_token'},
  ],
};

/// Descriptor for `PageDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pageDetailsDescriptor = $convert.base64Decode('CgtQYWdlRGV0YWlscxIbCglwYWdlX3NpemUYASABKAVSCHBhZ2VTaXplEiIKCnBhZ2VfdG9rZW4YAiABKAlIAFIJcGFnZVRva2VuiAEBQg0KC19wYWdlX3Rva2Vu');
