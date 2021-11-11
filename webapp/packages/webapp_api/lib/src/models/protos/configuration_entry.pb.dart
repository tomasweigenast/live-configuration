///
//  Generated code. Do not modify.
//  source: configuration_entry.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $0;
import 'google/protobuf/duration.pb.dart' as $1;

import 'configuration_entry.pbenum.dart';

export 'configuration_entry.pbenum.dart';

class ConfigurationGroup extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ConfigurationGroup', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'liveconfiguration.protobuf'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uid')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOM<$0.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'modifiedAt', subBuilder: $0.Timestamp.create)
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'entriesCount', $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'currentVersion', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  ConfigurationGroup._() : super();
  factory ConfigurationGroup({
    $core.String? uid,
    $core.String? name,
    $core.String? description,
    $0.Timestamp? createdAt,
    $0.Timestamp? modifiedAt,
    $core.int? entriesCount,
    $fixnum.Int64? currentVersion,
  }) {
    final _result = create();
    if (uid != null) {
      _result.uid = uid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (description != null) {
      _result.description = description;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (modifiedAt != null) {
      _result.modifiedAt = modifiedAt;
    }
    if (entriesCount != null) {
      _result.entriesCount = entriesCount;
    }
    if (currentVersion != null) {
      _result.currentVersion = currentVersion;
    }
    return _result;
  }
  factory ConfigurationGroup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfigurationGroup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfigurationGroup clone() => ConfigurationGroup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfigurationGroup copyWith(void Function(ConfigurationGroup) updates) => super.copyWith((message) => updates(message as ConfigurationGroup)) as ConfigurationGroup; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConfigurationGroup create() => ConfigurationGroup._();
  ConfigurationGroup createEmptyInstance() => create();
  static $pb.PbList<ConfigurationGroup> createRepeated() => $pb.PbList<ConfigurationGroup>();
  @$core.pragma('dart2js:noInline')
  static ConfigurationGroup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfigurationGroup>(create);
  static ConfigurationGroup? _defaultInstance;

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
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

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
  $core.int get entriesCount => $_getIZ(5);
  @$pb.TagNumber(6)
  set entriesCount($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasEntriesCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearEntriesCount() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get currentVersion => $_getI64(6);
  @$pb.TagNumber(7)
  set currentVersion($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCurrentVersion() => $_has(6);
  @$pb.TagNumber(7)
  void clearCurrentVersion() => clearField(7);
}

class ConfigurationGroupVersion extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ConfigurationGroupVersion', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'liveconfiguration.protobuf'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupUid')
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'version', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.Timestamp>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publishAt', subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false
  ;

  ConfigurationGroupVersion._() : super();
  factory ConfigurationGroupVersion({
    $core.String? groupUid,
    $fixnum.Int64? version,
    $0.Timestamp? createdAt,
    $0.Timestamp? publishAt,
  }) {
    final _result = create();
    if (groupUid != null) {
      _result.groupUid = groupUid;
    }
    if (version != null) {
      _result.version = version;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (publishAt != null) {
      _result.publishAt = publishAt;
    }
    return _result;
  }
  factory ConfigurationGroupVersion.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfigurationGroupVersion.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfigurationGroupVersion clone() => ConfigurationGroupVersion()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfigurationGroupVersion copyWith(void Function(ConfigurationGroupVersion) updates) => super.copyWith((message) => updates(message as ConfigurationGroupVersion)) as ConfigurationGroupVersion; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConfigurationGroupVersion create() => ConfigurationGroupVersion._();
  ConfigurationGroupVersion createEmptyInstance() => create();
  static $pb.PbList<ConfigurationGroupVersion> createRepeated() => $pb.PbList<ConfigurationGroupVersion>();
  @$core.pragma('dart2js:noInline')
  static ConfigurationGroupVersion getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfigurationGroupVersion>(create);
  static ConfigurationGroupVersion? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get groupUid => $_getSZ(0);
  @$pb.TagNumber(1)
  set groupUid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGroupUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearGroupUid() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get version => $_getI64(1);
  @$pb.TagNumber(2)
  set version($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersion() => clearField(2);

  @$pb.TagNumber(3)
  $0.Timestamp get createdAt => $_getN(2);
  @$pb.TagNumber(3)
  set createdAt($0.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatedAt() => clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureCreatedAt() => $_ensure(2);

  @$pb.TagNumber(4)
  $0.Timestamp get publishAt => $_getN(3);
  @$pb.TagNumber(4)
  set publishAt($0.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPublishAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearPublishAt() => clearField(4);
  @$pb.TagNumber(4)
  $0.Timestamp ensurePublishAt() => $_ensure(3);
}

class ConfigurationEntry extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ConfigurationEntry', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'liveconfiguration.protobuf'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'key')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOM<$0.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'modifiedAt', subBuilder: $0.Timestamp.create)
    ..aOM<ConfigurationEntryValue>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', subBuilder: ConfigurationEntryValue.create)
    ..hasRequiredFields = false
  ;

  ConfigurationEntry._() : super();
  factory ConfigurationEntry({
    $core.String? key,
    $core.String? name,
    $core.String? description,
    $0.Timestamp? createdAt,
    $0.Timestamp? modifiedAt,
    ConfigurationEntryValue? value,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (name != null) {
      _result.name = name;
    }
    if (description != null) {
      _result.description = description;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (modifiedAt != null) {
      _result.modifiedAt = modifiedAt;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory ConfigurationEntry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfigurationEntry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfigurationEntry clone() => ConfigurationEntry()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfigurationEntry copyWith(void Function(ConfigurationEntry) updates) => super.copyWith((message) => updates(message as ConfigurationEntry)) as ConfigurationEntry; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConfigurationEntry create() => ConfigurationEntry._();
  ConfigurationEntry createEmptyInstance() => create();
  static $pb.PbList<ConfigurationEntry> createRepeated() => $pb.PbList<ConfigurationEntry>();
  @$core.pragma('dart2js:noInline')
  static ConfigurationEntry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfigurationEntry>(create);
  static ConfigurationEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

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
  ConfigurationEntryValue get value => $_getN(5);
  @$pb.TagNumber(6)
  set value(ConfigurationEntryValue v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasValue() => $_has(5);
  @$pb.TagNumber(6)
  void clearValue() => clearField(6);
  @$pb.TagNumber(6)
  ConfigurationEntryValue ensureValue() => $_ensure(5);
}

enum ConfigurationEntryValue_Value {
  null_2, 
  boolValue, 
  stringValue, 
  intValue, 
  doubleValue, 
  timestampValue, 
  durationValue, 
  listValue, 
  mapValue, 
  rawJsonValue, 
  blobValue, 
  notSet
}

class ConfigurationEntryValue extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ConfigurationEntryValue_Value> _ConfigurationEntryValue_ValueByTag = {
    2 : ConfigurationEntryValue_Value.null_2,
    3 : ConfigurationEntryValue_Value.boolValue,
    4 : ConfigurationEntryValue_Value.stringValue,
    5 : ConfigurationEntryValue_Value.intValue,
    6 : ConfigurationEntryValue_Value.doubleValue,
    7 : ConfigurationEntryValue_Value.timestampValue,
    8 : ConfigurationEntryValue_Value.durationValue,
    9 : ConfigurationEntryValue_Value.listValue,
    10 : ConfigurationEntryValue_Value.mapValue,
    11 : ConfigurationEntryValue_Value.rawJsonValue,
    12 : ConfigurationEntryValue_Value.blobValue,
    0 : ConfigurationEntryValue_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ConfigurationEntryValue', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'liveconfiguration.protobuf'), createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
    ..e<ConfigurationEntryValueType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'valueType', $pb.PbFieldType.OE, defaultOrMaker: ConfigurationEntryValueType.CONFIGURATION_ENTRY_VALUE_TYPE_NULL, valueOf: ConfigurationEntryValueType.valueOf, enumValues: ConfigurationEntryValueType.values)
    ..aOM<ConfigurationEntryNullValue>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'null', subBuilder: ConfigurationEntryNullValue.create)
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'boolValue')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stringValue')
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'intValue')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'doubleValue', $pb.PbFieldType.OD)
    ..aOM<$0.Timestamp>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timestampValue', subBuilder: $0.Timestamp.create)
    ..aOM<$1.Duration>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'durationValue', subBuilder: $1.Duration.create)
    ..aOM<ConfigurationEntryListValue>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'listValue', subBuilder: ConfigurationEntryListValue.create)
    ..aOM<ConfigurationEntryMapValue>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mapValue', subBuilder: ConfigurationEntryMapValue.create)
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rawJsonValue')
    ..a<$core.List<$core.int>>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'blobValue', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  ConfigurationEntryValue._() : super();
  factory ConfigurationEntryValue({
    ConfigurationEntryValueType? valueType,
    ConfigurationEntryNullValue? null_2,
    $core.bool? boolValue,
    $core.String? stringValue,
    $fixnum.Int64? intValue,
    $core.double? doubleValue,
    $0.Timestamp? timestampValue,
    $1.Duration? durationValue,
    ConfigurationEntryListValue? listValue,
    ConfigurationEntryMapValue? mapValue,
    $core.String? rawJsonValue,
    $core.List<$core.int>? blobValue,
  }) {
    final _result = create();
    if (valueType != null) {
      _result.valueType = valueType;
    }
    if (null_2 != null) {
      _result.null_2 = null_2;
    }
    if (boolValue != null) {
      _result.boolValue = boolValue;
    }
    if (stringValue != null) {
      _result.stringValue = stringValue;
    }
    if (intValue != null) {
      _result.intValue = intValue;
    }
    if (doubleValue != null) {
      _result.doubleValue = doubleValue;
    }
    if (timestampValue != null) {
      _result.timestampValue = timestampValue;
    }
    if (durationValue != null) {
      _result.durationValue = durationValue;
    }
    if (listValue != null) {
      _result.listValue = listValue;
    }
    if (mapValue != null) {
      _result.mapValue = mapValue;
    }
    if (rawJsonValue != null) {
      _result.rawJsonValue = rawJsonValue;
    }
    if (blobValue != null) {
      _result.blobValue = blobValue;
    }
    return _result;
  }
  factory ConfigurationEntryValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfigurationEntryValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfigurationEntryValue clone() => ConfigurationEntryValue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfigurationEntryValue copyWith(void Function(ConfigurationEntryValue) updates) => super.copyWith((message) => updates(message as ConfigurationEntryValue)) as ConfigurationEntryValue; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConfigurationEntryValue create() => ConfigurationEntryValue._();
  ConfigurationEntryValue createEmptyInstance() => create();
  static $pb.PbList<ConfigurationEntryValue> createRepeated() => $pb.PbList<ConfigurationEntryValue>();
  @$core.pragma('dart2js:noInline')
  static ConfigurationEntryValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfigurationEntryValue>(create);
  static ConfigurationEntryValue? _defaultInstance;

  ConfigurationEntryValue_Value whichValue() => _ConfigurationEntryValue_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ConfigurationEntryValueType get valueType => $_getN(0);
  @$pb.TagNumber(1)
  set valueType(ConfigurationEntryValueType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasValueType() => $_has(0);
  @$pb.TagNumber(1)
  void clearValueType() => clearField(1);

  @$pb.TagNumber(2)
  ConfigurationEntryNullValue get null_2 => $_getN(1);
  @$pb.TagNumber(2)
  set null_2(ConfigurationEntryNullValue v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasNull_2() => $_has(1);
  @$pb.TagNumber(2)
  void clearNull_2() => clearField(2);
  @$pb.TagNumber(2)
  ConfigurationEntryNullValue ensureNull_2() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.bool get boolValue => $_getBF(2);
  @$pb.TagNumber(3)
  set boolValue($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBoolValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearBoolValue() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get stringValue => $_getSZ(3);
  @$pb.TagNumber(4)
  set stringValue($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStringValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearStringValue() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get intValue => $_getI64(4);
  @$pb.TagNumber(5)
  set intValue($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIntValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearIntValue() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get doubleValue => $_getN(5);
  @$pb.TagNumber(6)
  set doubleValue($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDoubleValue() => $_has(5);
  @$pb.TagNumber(6)
  void clearDoubleValue() => clearField(6);

  @$pb.TagNumber(7)
  $0.Timestamp get timestampValue => $_getN(6);
  @$pb.TagNumber(7)
  set timestampValue($0.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasTimestampValue() => $_has(6);
  @$pb.TagNumber(7)
  void clearTimestampValue() => clearField(7);
  @$pb.TagNumber(7)
  $0.Timestamp ensureTimestampValue() => $_ensure(6);

  @$pb.TagNumber(8)
  $1.Duration get durationValue => $_getN(7);
  @$pb.TagNumber(8)
  set durationValue($1.Duration v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasDurationValue() => $_has(7);
  @$pb.TagNumber(8)
  void clearDurationValue() => clearField(8);
  @$pb.TagNumber(8)
  $1.Duration ensureDurationValue() => $_ensure(7);

  @$pb.TagNumber(9)
  ConfigurationEntryListValue get listValue => $_getN(8);
  @$pb.TagNumber(9)
  set listValue(ConfigurationEntryListValue v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasListValue() => $_has(8);
  @$pb.TagNumber(9)
  void clearListValue() => clearField(9);
  @$pb.TagNumber(9)
  ConfigurationEntryListValue ensureListValue() => $_ensure(8);

  @$pb.TagNumber(10)
  ConfigurationEntryMapValue get mapValue => $_getN(9);
  @$pb.TagNumber(10)
  set mapValue(ConfigurationEntryMapValue v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasMapValue() => $_has(9);
  @$pb.TagNumber(10)
  void clearMapValue() => clearField(10);
  @$pb.TagNumber(10)
  ConfigurationEntryMapValue ensureMapValue() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.String get rawJsonValue => $_getSZ(10);
  @$pb.TagNumber(11)
  set rawJsonValue($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasRawJsonValue() => $_has(10);
  @$pb.TagNumber(11)
  void clearRawJsonValue() => clearField(11);

  @$pb.TagNumber(12)
  $core.List<$core.int> get blobValue => $_getN(11);
  @$pb.TagNumber(12)
  set blobValue($core.List<$core.int> v) { $_setBytes(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasBlobValue() => $_has(11);
  @$pb.TagNumber(12)
  void clearBlobValue() => clearField(12);
}

class ConfigurationEntryListValue extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ConfigurationEntryListValue', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'liveconfiguration.protobuf'), createEmptyInstance: create)
    ..pc<ConfigurationEntryValue>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'values', $pb.PbFieldType.PM, subBuilder: ConfigurationEntryValue.create)
    ..hasRequiredFields = false
  ;

  ConfigurationEntryListValue._() : super();
  factory ConfigurationEntryListValue({
    $core.Iterable<ConfigurationEntryValue>? values,
  }) {
    final _result = create();
    if (values != null) {
      _result.values.addAll(values);
    }
    return _result;
  }
  factory ConfigurationEntryListValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfigurationEntryListValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfigurationEntryListValue clone() => ConfigurationEntryListValue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfigurationEntryListValue copyWith(void Function(ConfigurationEntryListValue) updates) => super.copyWith((message) => updates(message as ConfigurationEntryListValue)) as ConfigurationEntryListValue; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConfigurationEntryListValue create() => ConfigurationEntryListValue._();
  ConfigurationEntryListValue createEmptyInstance() => create();
  static $pb.PbList<ConfigurationEntryListValue> createRepeated() => $pb.PbList<ConfigurationEntryListValue>();
  @$core.pragma('dart2js:noInline')
  static ConfigurationEntryListValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfigurationEntryListValue>(create);
  static ConfigurationEntryListValue? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ConfigurationEntryValue> get values => $_getList(0);
}

class ConfigurationEntryMapValue_ConfigurationEntryMapValueField extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ConfigurationEntryMapValue.ConfigurationEntryMapValueField', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'liveconfiguration.protobuf'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOM<ConfigurationEntryValue>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', subBuilder: ConfigurationEntryValue.create)
    ..hasRequiredFields = false
  ;

  ConfigurationEntryMapValue_ConfigurationEntryMapValueField._() : super();
  factory ConfigurationEntryMapValue_ConfigurationEntryMapValueField({
    $core.String? name,
    ConfigurationEntryValue? value,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory ConfigurationEntryMapValue_ConfigurationEntryMapValueField.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfigurationEntryMapValue_ConfigurationEntryMapValueField.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfigurationEntryMapValue_ConfigurationEntryMapValueField clone() => ConfigurationEntryMapValue_ConfigurationEntryMapValueField()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfigurationEntryMapValue_ConfigurationEntryMapValueField copyWith(void Function(ConfigurationEntryMapValue_ConfigurationEntryMapValueField) updates) => super.copyWith((message) => updates(message as ConfigurationEntryMapValue_ConfigurationEntryMapValueField)) as ConfigurationEntryMapValue_ConfigurationEntryMapValueField; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConfigurationEntryMapValue_ConfigurationEntryMapValueField create() => ConfigurationEntryMapValue_ConfigurationEntryMapValueField._();
  ConfigurationEntryMapValue_ConfigurationEntryMapValueField createEmptyInstance() => create();
  static $pb.PbList<ConfigurationEntryMapValue_ConfigurationEntryMapValueField> createRepeated() => $pb.PbList<ConfigurationEntryMapValue_ConfigurationEntryMapValueField>();
  @$core.pragma('dart2js:noInline')
  static ConfigurationEntryMapValue_ConfigurationEntryMapValueField getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfigurationEntryMapValue_ConfigurationEntryMapValueField>(create);
  static ConfigurationEntryMapValue_ConfigurationEntryMapValueField? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  ConfigurationEntryValue get value => $_getN(1);
  @$pb.TagNumber(2)
  set value(ConfigurationEntryValue v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
  @$pb.TagNumber(2)
  ConfigurationEntryValue ensureValue() => $_ensure(1);
}

class ConfigurationEntryMapValue extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ConfigurationEntryMapValue', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'liveconfiguration.protobuf'), createEmptyInstance: create)
    ..pc<ConfigurationEntryMapValue_ConfigurationEntryMapValueField>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fields', $pb.PbFieldType.PM, subBuilder: ConfigurationEntryMapValue_ConfigurationEntryMapValueField.create)
    ..hasRequiredFields = false
  ;

  ConfigurationEntryMapValue._() : super();
  factory ConfigurationEntryMapValue({
    $core.Iterable<ConfigurationEntryMapValue_ConfigurationEntryMapValueField>? fields,
  }) {
    final _result = create();
    if (fields != null) {
      _result.fields.addAll(fields);
    }
    return _result;
  }
  factory ConfigurationEntryMapValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfigurationEntryMapValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfigurationEntryMapValue clone() => ConfigurationEntryMapValue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfigurationEntryMapValue copyWith(void Function(ConfigurationEntryMapValue) updates) => super.copyWith((message) => updates(message as ConfigurationEntryMapValue)) as ConfigurationEntryMapValue; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConfigurationEntryMapValue create() => ConfigurationEntryMapValue._();
  ConfigurationEntryMapValue createEmptyInstance() => create();
  static $pb.PbList<ConfigurationEntryMapValue> createRepeated() => $pb.PbList<ConfigurationEntryMapValue>();
  @$core.pragma('dart2js:noInline')
  static ConfigurationEntryMapValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfigurationEntryMapValue>(create);
  static ConfigurationEntryMapValue? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ConfigurationEntryMapValue_ConfigurationEntryMapValueField> get fields => $_getList(0);
}

class ConfigurationEntryNullValue extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ConfigurationEntryNullValue', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'liveconfiguration.protobuf'), createEmptyInstance: create)
    ..e<ConfigurationEntryNullValue_ConfigurationEntryNullValueEnum>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value', $pb.PbFieldType.OE, defaultOrMaker: ConfigurationEntryNullValue_ConfigurationEntryNullValueEnum.ConfigurationEntryNullValueEnum_NULL, valueOf: ConfigurationEntryNullValue_ConfigurationEntryNullValueEnum.valueOf, enumValues: ConfigurationEntryNullValue_ConfigurationEntryNullValueEnum.values)
    ..hasRequiredFields = false
  ;

  ConfigurationEntryNullValue._() : super();
  factory ConfigurationEntryNullValue({
    ConfigurationEntryNullValue_ConfigurationEntryNullValueEnum? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory ConfigurationEntryNullValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfigurationEntryNullValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfigurationEntryNullValue clone() => ConfigurationEntryNullValue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfigurationEntryNullValue copyWith(void Function(ConfigurationEntryNullValue) updates) => super.copyWith((message) => updates(message as ConfigurationEntryNullValue)) as ConfigurationEntryNullValue; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConfigurationEntryNullValue create() => ConfigurationEntryNullValue._();
  ConfigurationEntryNullValue createEmptyInstance() => create();
  static $pb.PbList<ConfigurationEntryNullValue> createRepeated() => $pb.PbList<ConfigurationEntryNullValue>();
  @$core.pragma('dart2js:noInline')
  static ConfigurationEntryNullValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfigurationEntryNullValue>(create);
  static ConfigurationEntryNullValue? _defaultInstance;

  @$pb.TagNumber(1)
  ConfigurationEntryNullValue_ConfigurationEntryNullValueEnum get value => $_getN(0);
  @$pb.TagNumber(1)
  set value(ConfigurationEntryNullValue_ConfigurationEntryNullValueEnum v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

