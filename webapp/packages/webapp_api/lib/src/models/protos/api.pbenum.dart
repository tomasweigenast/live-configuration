///
//  Generated code. Do not modify.
//  source: api.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ApiResponseStatusCode extends $pb.ProtobufEnum {
  static const ApiResponseStatusCode OK = ApiResponseStatusCode._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OK');
  static const ApiResponseStatusCode CANCELLED = ApiResponseStatusCode._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CANCELLED');
  static const ApiResponseStatusCode UNKNOWN = ApiResponseStatusCode._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const ApiResponseStatusCode INVALID_ARGUMENT = ApiResponseStatusCode._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INVALID_ARGUMENT');
  static const ApiResponseStatusCode DEADLINE_EXCEEDED = ApiResponseStatusCode._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DEADLINE_EXCEEDED');
  static const ApiResponseStatusCode NOT_FOUND = ApiResponseStatusCode._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NOT_FOUND');
  static const ApiResponseStatusCode ALREADY_EXISTS = ApiResponseStatusCode._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ALREADY_EXISTS');
  static const ApiResponseStatusCode PERMISSION_DENIED = ApiResponseStatusCode._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PERMISSION_DENIED');
  static const ApiResponseStatusCode UNAUTHENTICATED = ApiResponseStatusCode._(16, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNAUTHENTICATED');
  static const ApiResponseStatusCode RESOURCE_EXHAUSTED = ApiResponseStatusCode._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RESOURCE_EXHAUSTED');
  static const ApiResponseStatusCode FAILED_PRECONDITION = ApiResponseStatusCode._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FAILED_PRECONDITION');
  static const ApiResponseStatusCode ABORTED = ApiResponseStatusCode._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ABORTED');
  static const ApiResponseStatusCode OUT_OF_RANGE = ApiResponseStatusCode._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OUT_OF_RANGE');
  static const ApiResponseStatusCode UNIMPLEMENTED = ApiResponseStatusCode._(12, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNIMPLEMENTED');
  static const ApiResponseStatusCode INTERNAL = ApiResponseStatusCode._(13, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INTERNAL');
  static const ApiResponseStatusCode UNAVAILABLE = ApiResponseStatusCode._(14, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNAVAILABLE');
  static const ApiResponseStatusCode DATA_LOSS = ApiResponseStatusCode._(15, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DATA_LOSS');

  static const $core.List<ApiResponseStatusCode> values = <ApiResponseStatusCode> [
    OK,
    CANCELLED,
    UNKNOWN,
    INVALID_ARGUMENT,
    DEADLINE_EXCEEDED,
    NOT_FOUND,
    ALREADY_EXISTS,
    PERMISSION_DENIED,
    UNAUTHENTICATED,
    RESOURCE_EXHAUSTED,
    FAILED_PRECONDITION,
    ABORTED,
    OUT_OF_RANGE,
    UNIMPLEMENTED,
    INTERNAL,
    UNAVAILABLE,
    DATA_LOSS,
  ];

  static final $core.Map<$core.int, ApiResponseStatusCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ApiResponseStatusCode? valueOf($core.int value) => _byValue[value];

  const ApiResponseStatusCode._($core.int v, $core.String n) : super(v, n);
}

