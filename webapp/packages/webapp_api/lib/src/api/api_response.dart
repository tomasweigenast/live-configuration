import 'dart:collection';

import 'package:webapp_api/src/models/protos/api.pb.dart' as pb0;

/// Describes a base response of an API request.
abstract class OperationStatus<TModel extends Object> {
  final pb0.ApiResponseStatusCode _statusCode;
  final String? _message;
  final ResourceInfo? _resourceInfo;

  pb0.ApiResponseStatusCode get statusCode => _statusCode;
  String? get message => _message;
  ResourceInfo? get resourceInfo => _resourceInfo;
  bool get hasResponseBody;
  bool get isSuccess => _statusCode == pb0.ApiResponseStatusCode.OK;
  bool get isFailed => !isSuccess;
  TModel get responseBody;

  const OperationStatus._internal(this._statusCode, this._message, this._resourceInfo);
}

/// Represents a successful response status with an optional response body.
class SuccessOperationStatus<TResponse extends Object> extends OperationStatus<TResponse> {
  final TResponse? _response;
  
  @override
  bool get hasResponseBody => _response != null;

  @override
  TResponse get responseBody => _response!;

  const SuccessOperationStatus({TResponse? responseBody}) 
    : _response = responseBody, super._internal(pb0.ApiResponseStatusCode.OK, null, null);
}

// General information about any error. This can be caused by server-side problems, quota failure errors, etc.
class ErrorOperationStatus extends OperationStatus {
  final String _reason;
  final Map<String, String>? _metadata;

  String get reason => _reason;
  Map<String, String> get metadata => _metadata!;
  bool get hasMetadata => _metadata != null;
  
  @override
  bool get hasResponseBody => false;
  
  @override
  Object get responseBody => throw Exception("An error operation does not contain body.");

  const ErrorOperationStatus({required String message, required String reason, Map<String, String>? metadata, required pb0.ApiResponseStatusCode statusCode, ResourceInfo? resourceInfo}) 
    : _reason = reason,
      _metadata = metadata,
      super._internal(statusCode, message, resourceInfo);

}

/// Describes an error parsing an incoming request. This is an error caused by the client.
class BadRequestOperation extends OperationStatus {
  final Iterable<FieldViolation> _violations;

  List<FieldViolation> get violations => UnmodifiableListView(_violations);
  
  @override
  bool get hasResponseBody => false;

  @override
  Object get responseBody => throw Exception("A bad request operation does not contain body.");

  const BadRequestOperation({required String message, required Iterable<FieldViolation> violations}) 
    : _violations = violations, super._internal(pb0.ApiResponseStatusCode.INVALID_ARGUMENT, message, null);
}

/// Describes information about a resource being accessed.
class ResourceInfo {
  final String _resourceType, _resourceName;

  String get resourceType => _resourceType;
  String get resourceName => _resourceName;

  const ResourceInfo({required String resourceType, required String resourceName, required String description}) 
    : _resourceName = resourceName, _resourceType = resourceType;
}

/// Describes a violation in a field.
class FieldViolation {
  final String _fieldName, _violation;

  String get fieldName => _fieldName;
  String get violation => _violation;

  FieldViolation({required String fieldName, required String violation}) : _fieldName = fieldName, _violation = violation;    
}

class PageDetails {
  final int pageSize;
  final String? pageToken;

  const PageDetails({required this.pageSize, this.pageToken});
}