///
//  Generated code. Do not modify.
//  source: project.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $0;
import 'common.pb.dart' as $1;

class Project extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Project', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'liveconfiguration.protobuf'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'organizationUid')
    ..aOM<$0.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'modifiedAt', subBuilder: $0.Timestamp.create)
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isFavorite')
    ..hasRequiredFields = false
  ;

  Project._() : super();
  factory Project({
    $core.String? uid,
    $core.String? name,
    $core.String? organizationUid,
    $0.Timestamp? createdAt,
    $0.Timestamp? modifiedAt,
    $core.bool? isFavorite,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (organizationUid != null) {
      _result.organizationUid = organizationUid;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (modifiedAt != null) {
      _result.modifiedAt = modifiedAt;
    }
    if (isFavorite != null) {
      _result.isFavorite = isFavorite;
    }
    return _result;
  }
  factory Project.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Project.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Project clone() => Project()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Project copyWith(void Function(Project) updates) => super.copyWith((message) => updates(message as Project)) as Project; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Project create() => Project._();
  Project createEmptyInstance() => create();
  static $pb.PbList<Project> createRepeated() => $pb.PbList<Project>();
  @$core.pragma('dart2js:noInline')
  static Project getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Project>(create);
  static Project? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get organizationUid => $_getSZ(2);
  @$pb.TagNumber(3)
  set organizationUid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOrganizationUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearOrganizationUid() => clearField(3);

  @$pb.TagNumber(4)
  $0.Timestamp get createdAt => $_getN(3);
  @$pb.TagNumber(4)
  set createdAt($0.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedAt() => clearField(4);
  @$pb.TagNumber(4)
  $0.Timestamp ensureCreatedAt() => $_ensure(3);

  @$pb.TagNumber(5)
  $0.Timestamp get modifiedAt => $_getN(4);
  @$pb.TagNumber(5)
  set modifiedAt($0.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasModifiedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearModifiedAt() => clearField(5);
  @$pb.TagNumber(5)
  $0.Timestamp ensureModifiedAt() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.bool get isFavorite => $_getBF(5);
  @$pb.TagNumber(6)
  set isFavorite($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsFavorite() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsFavorite() => clearField(6);
}

class ProjectSettings extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ProjectSettings', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'liveconfiguration.protobuf'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'enabled')
    ..hasRequiredFields = false
  ;

  ProjectSettings._() : super();
  factory ProjectSettings({
    $core.bool? enabled,
  }) {
    final _result = create();
    if (enabled != null) {
      _result.enabled = enabled;
    }
    return _result;
  }
  factory ProjectSettings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProjectSettings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProjectSettings clone() => ProjectSettings()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProjectSettings copyWith(void Function(ProjectSettings) updates) => super.copyWith((message) => updates(message as ProjectSettings)) as ProjectSettings; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProjectSettings create() => ProjectSettings._();
  ProjectSettings createEmptyInstance() => create();
  static $pb.PbList<ProjectSettings> createRepeated() => $pb.PbList<ProjectSettings>();
  @$core.pragma('dart2js:noInline')
  static ProjectSettings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProjectSettings>(create);
  static ProjectSettings? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get enabled => $_getBF(0);
  @$pb.TagNumber(1)
  set enabled($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnabled() => clearField(1);
}

class ProjectUsage_Operations extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ProjectUsage.Operations', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'liveconfiguration.protobuf'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateOperations', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'readOperations', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  ProjectUsage_Operations._() : super();
  factory ProjectUsage_Operations({
    $core.int? updateOperations,
    $core.int? readOperations,
  }) {
    final _result = create();
    if (updateOperations != null) {
      _result.updateOperations = updateOperations;
    }
    if (readOperations != null) {
      _result.readOperations = readOperations;
    }
    return _result;
  }
  factory ProjectUsage_Operations.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProjectUsage_Operations.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProjectUsage_Operations clone() => ProjectUsage_Operations()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProjectUsage_Operations copyWith(void Function(ProjectUsage_Operations) updates) => super.copyWith((message) => updates(message as ProjectUsage_Operations)) as ProjectUsage_Operations; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProjectUsage_Operations create() => ProjectUsage_Operations._();
  ProjectUsage_Operations createEmptyInstance() => create();
  static $pb.PbList<ProjectUsage_Operations> createRepeated() => $pb.PbList<ProjectUsage_Operations>();
  @$core.pragma('dart2js:noInline')
  static ProjectUsage_Operations getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProjectUsage_Operations>(create);
  static ProjectUsage_Operations? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get updateOperations => $_getIZ(0);
  @$pb.TagNumber(1)
  set updateOperations($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUpdateOperations() => $_has(0);
  @$pb.TagNumber(1)
  void clearUpdateOperations() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get readOperations => $_getIZ(1);
  @$pb.TagNumber(2)
  set readOperations($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReadOperations() => $_has(1);
  @$pb.TagNumber(2)
  void clearReadOperations() => clearField(2);
}

class ProjectUsage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ProjectUsage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'liveconfiguration.protobuf'), createEmptyInstance: create)
    ..aOM<$1.Period>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'period', subBuilder: $1.Period.create)
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalRequests')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'requestsPerSecond', $pb.PbFieldType.O3)
    ..aOM<ProjectUsage_Operations>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'operations', subBuilder: ProjectUsage_Operations.create)
    ..hasRequiredFields = false
  ;

  ProjectUsage._() : super();
  factory ProjectUsage({
    $1.Period? period,
    $fixnum.Int64? totalRequests,
    $core.int? requestsPerSecond,
    ProjectUsage_Operations? operations,
  }) {
    final _result = create();
    if (period != null) {
      _result.period = period;
    }
    if (totalRequests != null) {
      _result.totalRequests = totalRequests;
    }
    if (requestsPerSecond != null) {
      _result.requestsPerSecond = requestsPerSecond;
    }
    if (operations != null) {
      _result.operations = operations;
    }
    return _result;
  }
  factory ProjectUsage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProjectUsage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProjectUsage clone() => ProjectUsage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProjectUsage copyWith(void Function(ProjectUsage) updates) => super.copyWith((message) => updates(message as ProjectUsage)) as ProjectUsage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProjectUsage create() => ProjectUsage._();
  ProjectUsage createEmptyInstance() => create();
  static $pb.PbList<ProjectUsage> createRepeated() => $pb.PbList<ProjectUsage>();
  @$core.pragma('dart2js:noInline')
  static ProjectUsage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProjectUsage>(create);
  static ProjectUsage? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Period get period => $_getN(0);
  @$pb.TagNumber(1)
  set period($1.Period v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeriod() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeriod() => clearField(1);
  @$pb.TagNumber(1)
  $1.Period ensurePeriod() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get totalRequests => $_getI64(1);
  @$pb.TagNumber(2)
  set totalRequests($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotalRequests() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalRequests() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get requestsPerSecond => $_getIZ(2);
  @$pb.TagNumber(3)
  set requestsPerSecond($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRequestsPerSecond() => $_has(2);
  @$pb.TagNumber(3)
  void clearRequestsPerSecond() => clearField(3);

  @$pb.TagNumber(4)
  ProjectUsage_Operations get operations => $_getN(3);
  @$pb.TagNumber(4)
  set operations(ProjectUsage_Operations v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasOperations() => $_has(3);
  @$pb.TagNumber(4)
  void clearOperations() => clearField(4);
  @$pb.TagNumber(4)
  ProjectUsage_Operations ensureOperations() => $_ensure(3);
}

