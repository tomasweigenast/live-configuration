///
//  Generated code. Do not modify.
//  source: organization.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $0;

import 'organization.pbenum.dart';

export 'organization.pbenum.dart';

class Organization extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Organization', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'liveconfiguration.protobuf'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accountUid')
    ..aOM<$0.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastModified', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  Organization._() : super();
  factory Organization({
    $core.String? uid,
    $core.String? name,
    $core.String? accountUid,
    $0.Timestamp? createdAt,
    $0.Timestamp? lastModified,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (accountUid != null) {
      _result.accountUid = accountUid;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (lastModified != null) {
      _result.lastModified = lastModified;
    }
    return _result;
  }
  factory Organization.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Organization.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Organization clone() => Organization()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Organization copyWith(void Function(Organization) updates) => super.copyWith((message) => updates(message as Organization)) as Organization; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Organization create() => Organization._();
  Organization createEmptyInstance() => create();
  static $pb.PbList<Organization> createRepeated() => $pb.PbList<Organization>();
  @$core.pragma('dart2js:noInline')
  static Organization getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Organization>(create);
  static Organization? _defaultInstance;

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
  $core.String get accountUid => $_getSZ(2);
  @$pb.TagNumber(3)
  set accountUid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAccountUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccountUid() => clearField(3);

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
  $0.Timestamp get lastModified => $_getN(4);
  @$pb.TagNumber(5)
  set lastModified($0.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasLastModified() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastModified() => clearField(5);
  @$pb.TagNumber(5)
  $0.Timestamp ensureLastModified() => $_ensure(4);
}

enum OrganizationMember_OrganizationMemberAccessPolicy_Metadata {
  project, 
  notSet
}

class OrganizationMember_OrganizationMemberAccessPolicy extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, OrganizationMember_OrganizationMemberAccessPolicy_Metadata> _OrganizationMember_OrganizationMemberAccessPolicy_MetadataByTag = {
    2 : OrganizationMember_OrganizationMemberAccessPolicy_Metadata.project,
    0 : OrganizationMember_OrganizationMemberAccessPolicy_Metadata.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'OrganizationMember.OrganizationMemberAccessPolicy', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'liveconfiguration.protobuf'), createEmptyInstance: create)
    ..oo(0, [2])
    ..e<OrganizationPolicy>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'policy', $pb.PbFieldType.OE, defaultOrMaker: OrganizationPolicy.ORGANIZATION_MEMBER_POLICY_UNDEFINED, valueOf: OrganizationPolicy.valueOf, enumValues: OrganizationPolicy.values)
    ..aOM<OrganizationPolicyProject>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'project', subBuilder: OrganizationPolicyProject.create)
    ..hasRequiredFields = false
  ;

  OrganizationMember_OrganizationMemberAccessPolicy._() : super();
  factory OrganizationMember_OrganizationMemberAccessPolicy({
    OrganizationPolicy? policy,
    OrganizationPolicyProject? project,
  }) {
    final _result = create();
    if (policy != null) {
      _result.policy = policy;
    }
    if (project != null) {
      _result.project = project;
    }
    return _result;
  }
  factory OrganizationMember_OrganizationMemberAccessPolicy.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OrganizationMember_OrganizationMemberAccessPolicy.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OrganizationMember_OrganizationMemberAccessPolicy clone() => OrganizationMember_OrganizationMemberAccessPolicy()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OrganizationMember_OrganizationMemberAccessPolicy copyWith(void Function(OrganizationMember_OrganizationMemberAccessPolicy) updates) => super.copyWith((message) => updates(message as OrganizationMember_OrganizationMemberAccessPolicy)) as OrganizationMember_OrganizationMemberAccessPolicy; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OrganizationMember_OrganizationMemberAccessPolicy create() => OrganizationMember_OrganizationMemberAccessPolicy._();
  OrganizationMember_OrganizationMemberAccessPolicy createEmptyInstance() => create();
  static $pb.PbList<OrganizationMember_OrganizationMemberAccessPolicy> createRepeated() => $pb.PbList<OrganizationMember_OrganizationMemberAccessPolicy>();
  @$core.pragma('dart2js:noInline')
  static OrganizationMember_OrganizationMemberAccessPolicy getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OrganizationMember_OrganizationMemberAccessPolicy>(create);
  static OrganizationMember_OrganizationMemberAccessPolicy? _defaultInstance;

  OrganizationMember_OrganizationMemberAccessPolicy_Metadata whichMetadata() => _OrganizationMember_OrganizationMemberAccessPolicy_MetadataByTag[$_whichOneof(0)]!;
  void clearMetadata() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  OrganizationPolicy get policy => $_getN(0);
  @$pb.TagNumber(1)
  set policy(OrganizationPolicy v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPolicy() => $_has(0);
  @$pb.TagNumber(1)
  void clearPolicy() => clearField(1);

  @$pb.TagNumber(2)
  OrganizationPolicyProject get project => $_getN(1);
  @$pb.TagNumber(2)
  set project(OrganizationPolicyProject v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasProject() => $_has(1);
  @$pb.TagNumber(2)
  void clearProject() => clearField(2);
  @$pb.TagNumber(2)
  OrganizationPolicyProject ensureProject() => $_ensure(1);
}

class OrganizationMember extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'OrganizationMember', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'liveconfiguration.protobuf'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'organizationUid')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accountUid')
    ..aOM<$0.Timestamp>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'addedTime', subBuilder: $0.Timestamp.create)
    ..aOM<OrganizationMember_OrganizationMemberAccessPolicy>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'policy', subBuilder: OrganizationMember_OrganizationMemberAccessPolicy.create)
    ..hasRequiredFields = false
  ;

  OrganizationMember._() : super();
  factory OrganizationMember({
    $core.String? organizationUid,
    $core.String? accountUid,
    $0.Timestamp? addedTime,
    OrganizationMember_OrganizationMemberAccessPolicy? policy,
  }) {
    final _result = create();
    if (organizationUid != null) {
      _result.organizationUid = organizationUid;
    }
    if (accountUid != null) {
      _result.accountUid = accountUid;
    }
    if (addedTime != null) {
      _result.addedTime = addedTime;
    }
    if (policy != null) {
      _result.policy = policy;
    }
    return _result;
  }
  factory OrganizationMember.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OrganizationMember.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OrganizationMember clone() => OrganizationMember()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OrganizationMember copyWith(void Function(OrganizationMember) updates) => super.copyWith((message) => updates(message as OrganizationMember)) as OrganizationMember; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OrganizationMember create() => OrganizationMember._();
  OrganizationMember createEmptyInstance() => create();
  static $pb.PbList<OrganizationMember> createRepeated() => $pb.PbList<OrganizationMember>();
  @$core.pragma('dart2js:noInline')
  static OrganizationMember getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OrganizationMember>(create);
  static OrganizationMember? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get organizationUid => $_getSZ(0);
  @$pb.TagNumber(1)
  set organizationUid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOrganizationUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrganizationUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get accountUid => $_getSZ(1);
  @$pb.TagNumber(2)
  set accountUid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAccountUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccountUid() => clearField(2);

  @$pb.TagNumber(3)
  $0.Timestamp get addedTime => $_getN(2);
  @$pb.TagNumber(3)
  set addedTime($0.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAddedTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearAddedTime() => clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureAddedTime() => $_ensure(2);

  @$pb.TagNumber(4)
  OrganizationMember_OrganizationMemberAccessPolicy get policy => $_getN(3);
  @$pb.TagNumber(4)
  set policy(OrganizationMember_OrganizationMemberAccessPolicy v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPolicy() => $_has(3);
  @$pb.TagNumber(4)
  void clearPolicy() => clearField(4);
  @$pb.TagNumber(4)
  OrganizationMember_OrganizationMemberAccessPolicy ensurePolicy() => $_ensure(3);
}

class OrganizationPolicyProject extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'OrganizationPolicyProject', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'liveconfiguration.protobuf'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'projectIds')
    ..hasRequiredFields = false
  ;

  OrganizationPolicyProject._() : super();
  factory OrganizationPolicyProject({
    $core.Iterable<$core.String>? projectIds,
  }) {
    final _result = create();
    if (projectIds != null) {
      _result.projectIds.addAll(projectIds);
    }
    return _result;
  }
  factory OrganizationPolicyProject.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OrganizationPolicyProject.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OrganizationPolicyProject clone() => OrganizationPolicyProject()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OrganizationPolicyProject copyWith(void Function(OrganizationPolicyProject) updates) => super.copyWith((message) => updates(message as OrganizationPolicyProject)) as OrganizationPolicyProject; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OrganizationPolicyProject create() => OrganizationPolicyProject._();
  OrganizationPolicyProject createEmptyInstance() => create();
  static $pb.PbList<OrganizationPolicyProject> createRepeated() => $pb.PbList<OrganizationPolicyProject>();
  @$core.pragma('dart2js:noInline')
  static OrganizationPolicyProject getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OrganizationPolicyProject>(create);
  static OrganizationPolicyProject? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get projectIds => $_getList(0);
}

