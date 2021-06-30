///
//  Generated code. Do not modify.
//  source: live_configuration.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $0;
import 'google/protobuf/duration.pb.dart' as $1;

import 'live_configuration.pbenum.dart';

export 'live_configuration.pbenum.dart';

class ConfigurationEntries extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConfigurationEntries',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'liveconfiguration.protobuf'),
      createEmptyInstance: create)
    ..pc<ConfigurationEntry>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'entries',
        $pb.PbFieldType.PM,
        subBuilder: ConfigurationEntry.create)
    ..hasRequiredFields = false;

  ConfigurationEntries._() : super();
  factory ConfigurationEntries({
    $core.Iterable<ConfigurationEntry>? entries,
  }) {
    final _result = create();
    if (entries != null) {
      _result.entries.addAll(entries);
    }
    return _result;
  }
  factory ConfigurationEntries.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConfigurationEntries.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConfigurationEntries clone() =>
      ConfigurationEntries()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConfigurationEntries copyWith(void Function(ConfigurationEntries) updates) =>
      super.copyWith((message) => updates(message as ConfigurationEntries))
          as ConfigurationEntries; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConfigurationEntries create() => ConfigurationEntries._();
  ConfigurationEntries createEmptyInstance() => create();
  static $pb.PbList<ConfigurationEntries> createRepeated() =>
      $pb.PbList<ConfigurationEntries>();
  @$core.pragma('dart2js:noInline')
  static ConfigurationEntries getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConfigurationEntries>(create);
  static ConfigurationEntries? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ConfigurationEntry> get entries => $_getList(0);
}

class ConfigurationEntry extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConfigurationEntry',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'liveconfiguration.protobuf'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'key')
    ..e<ConfigurationEntryValueType>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'valueType', $pb.PbFieldType.OE,
        defaultOrMaker:
            ConfigurationEntryValueType.ConfigurationEntryValueType_STRING,
        valueOf: ConfigurationEntryValueType.valueOf,
        enumValues: ConfigurationEntryValueType.values)
    ..aOM<ConfigurationEntryValue>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value',
        subBuilder: ConfigurationEntryValue.create)
    ..hasRequiredFields = false;

  ConfigurationEntry._() : super();
  factory ConfigurationEntry({
    $core.String? key,
    ConfigurationEntryValueType? valueType,
    ConfigurationEntryValue? value,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (valueType != null) {
      _result.valueType = valueType;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory ConfigurationEntry.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConfigurationEntry.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConfigurationEntry clone() => ConfigurationEntry()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConfigurationEntry copyWith(void Function(ConfigurationEntry) updates) =>
      super.copyWith((message) => updates(message as ConfigurationEntry))
          as ConfigurationEntry; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConfigurationEntry create() => ConfigurationEntry._();
  ConfigurationEntry createEmptyInstance() => create();
  static $pb.PbList<ConfigurationEntry> createRepeated() =>
      $pb.PbList<ConfigurationEntry>();
  @$core.pragma('dart2js:noInline')
  static ConfigurationEntry getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConfigurationEntry>(create);
  static ConfigurationEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  ConfigurationEntryValueType get valueType => $_getN(1);
  @$pb.TagNumber(2)
  set valueType(ConfigurationEntryValueType v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasValueType() => $_has(1);
  @$pb.TagNumber(2)
  void clearValueType() => clearField(2);

  @$pb.TagNumber(3)
  ConfigurationEntryValue get value => $_getN(2);
  @$pb.TagNumber(3)
  set value(ConfigurationEntryValue v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => clearField(3);
  @$pb.TagNumber(3)
  ConfigurationEntryValue ensureValue() => $_ensure(2);
}

enum ConfigurationEntryValue_Kind {
  nullValue,
  stringValue,
  intValue,
  doubleValue,
  boolValue,
  listValue,
  mapValue,
  timestampValue,
  durationValue,
  notSet
}

class ConfigurationEntryValue extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ConfigurationEntryValue_Kind>
      _ConfigurationEntryValue_KindByTag = {
    1: ConfigurationEntryValue_Kind.nullValue,
    2: ConfigurationEntryValue_Kind.stringValue,
    3: ConfigurationEntryValue_Kind.intValue,
    4: ConfigurationEntryValue_Kind.doubleValue,
    5: ConfigurationEntryValue_Kind.boolValue,
    6: ConfigurationEntryValue_Kind.listValue,
    7: ConfigurationEntryValue_Kind.mapValue,
    8: ConfigurationEntryValue_Kind.timestampValue,
    9: ConfigurationEntryValue_Kind.durationValue,
    0: ConfigurationEntryValue_Kind.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConfigurationEntryValue',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'liveconfiguration.protobuf'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7, 8, 9])
    ..e<ConfigurationEntryValue_NullValue>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'nullValue',
        $pb.PbFieldType.OE,
        defaultOrMaker: ConfigurationEntryValue_NullValue.NULL_VALUE_NULL,
        valueOf: ConfigurationEntryValue_NullValue.valueOf,
        enumValues: ConfigurationEntryValue_NullValue.values)
    ..aOS(2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stringValue')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'intValue')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'doubleValue', $pb.PbFieldType.OD)
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'boolValue')
    ..aOM<ConfigurationEntryListValue>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'listValue', subBuilder: ConfigurationEntryListValue.create)
    ..aOM<ConfigurationEntryMapValue>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mapValue', subBuilder: ConfigurationEntryMapValue.create)
    ..aOM<$0.Timestamp>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timestampValue', subBuilder: $0.Timestamp.create)
    ..aOM<$1.Duration>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'durationValue', subBuilder: $1.Duration.create)
    ..hasRequiredFields = false;

  ConfigurationEntryValue._() : super();
  factory ConfigurationEntryValue({
    ConfigurationEntryValue_NullValue? nullValue,
    $core.String? stringValue,
    $fixnum.Int64? intValue,
    $core.double? doubleValue,
    $core.bool? boolValue,
    ConfigurationEntryListValue? listValue,
    ConfigurationEntryMapValue? mapValue,
    $0.Timestamp? timestampValue,
    $1.Duration? durationValue,
  }) {
    final _result = create();
    if (nullValue != null) {
      _result.nullValue = nullValue;
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
    if (boolValue != null) {
      _result.boolValue = boolValue;
    }
    if (listValue != null) {
      _result.listValue = listValue;
    }
    if (mapValue != null) {
      _result.mapValue = mapValue;
    }
    if (timestampValue != null) {
      _result.timestampValue = timestampValue;
    }
    if (durationValue != null) {
      _result.durationValue = durationValue;
    }
    return _result;
  }
  factory ConfigurationEntryValue.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConfigurationEntryValue.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConfigurationEntryValue clone() =>
      ConfigurationEntryValue()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConfigurationEntryValue copyWith(
          void Function(ConfigurationEntryValue) updates) =>
      super.copyWith((message) => updates(message as ConfigurationEntryValue))
          as ConfigurationEntryValue; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConfigurationEntryValue create() => ConfigurationEntryValue._();
  ConfigurationEntryValue createEmptyInstance() => create();
  static $pb.PbList<ConfigurationEntryValue> createRepeated() =>
      $pb.PbList<ConfigurationEntryValue>();
  @$core.pragma('dart2js:noInline')
  static ConfigurationEntryValue getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConfigurationEntryValue>(create);
  static ConfigurationEntryValue? _defaultInstance;

  ConfigurationEntryValue_Kind whichKind() =>
      _ConfigurationEntryValue_KindByTag[$_whichOneof(0)]!;
  void clearKind() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ConfigurationEntryValue_NullValue get nullValue => $_getN(0);
  @$pb.TagNumber(1)
  set nullValue(ConfigurationEntryValue_NullValue v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNullValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearNullValue() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get stringValue => $_getSZ(1);
  @$pb.TagNumber(2)
  set stringValue($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStringValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearStringValue() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get intValue => $_getI64(2);
  @$pb.TagNumber(3)
  set intValue($fixnum.Int64 v) {
    $_setInt64(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIntValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearIntValue() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get doubleValue => $_getN(3);
  @$pb.TagNumber(4)
  set doubleValue($core.double v) {
    $_setDouble(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDoubleValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearDoubleValue() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get boolValue => $_getBF(4);
  @$pb.TagNumber(5)
  set boolValue($core.bool v) {
    $_setBool(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasBoolValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearBoolValue() => clearField(5);

  @$pb.TagNumber(6)
  ConfigurationEntryListValue get listValue => $_getN(5);
  @$pb.TagNumber(6)
  set listValue(ConfigurationEntryListValue v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasListValue() => $_has(5);
  @$pb.TagNumber(6)
  void clearListValue() => clearField(6);
  @$pb.TagNumber(6)
  ConfigurationEntryListValue ensureListValue() => $_ensure(5);

  @$pb.TagNumber(7)
  ConfigurationEntryMapValue get mapValue => $_getN(6);
  @$pb.TagNumber(7)
  set mapValue(ConfigurationEntryMapValue v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasMapValue() => $_has(6);
  @$pb.TagNumber(7)
  void clearMapValue() => clearField(7);
  @$pb.TagNumber(7)
  ConfigurationEntryMapValue ensureMapValue() => $_ensure(6);

  @$pb.TagNumber(8)
  $0.Timestamp get timestampValue => $_getN(7);
  @$pb.TagNumber(8)
  set timestampValue($0.Timestamp v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasTimestampValue() => $_has(7);
  @$pb.TagNumber(8)
  void clearTimestampValue() => clearField(8);
  @$pb.TagNumber(8)
  $0.Timestamp ensureTimestampValue() => $_ensure(7);

  @$pb.TagNumber(9)
  $1.Duration get durationValue => $_getN(8);
  @$pb.TagNumber(9)
  set durationValue($1.Duration v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasDurationValue() => $_has(8);
  @$pb.TagNumber(9)
  void clearDurationValue() => clearField(9);
  @$pb.TagNumber(9)
  $1.Duration ensureDurationValue() => $_ensure(8);
}

class ConfigurationEntryListValue extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConfigurationEntryListValue',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'liveconfiguration.protobuf'),
      createEmptyInstance: create)
    ..pc<ConfigurationEntryValue>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'values',
        $pb.PbFieldType.PM,
        subBuilder: ConfigurationEntryValue.create)
    ..hasRequiredFields = false;

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
  factory ConfigurationEntryListValue.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConfigurationEntryListValue.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConfigurationEntryListValue clone() =>
      ConfigurationEntryListValue()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConfigurationEntryListValue copyWith(
          void Function(ConfigurationEntryListValue) updates) =>
      super.copyWith(
              (message) => updates(message as ConfigurationEntryListValue))
          as ConfigurationEntryListValue; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConfigurationEntryListValue create() =>
      ConfigurationEntryListValue._();
  ConfigurationEntryListValue createEmptyInstance() => create();
  static $pb.PbList<ConfigurationEntryListValue> createRepeated() =>
      $pb.PbList<ConfigurationEntryListValue>();
  @$core.pragma('dart2js:noInline')
  static ConfigurationEntryListValue getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConfigurationEntryListValue>(create);
  static ConfigurationEntryListValue? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ConfigurationEntryValue> get values => $_getList(0);
}

class ConfigurationEntryMapValue extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConfigurationEntryMapValue',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'liveconfiguration.protobuf'),
      createEmptyInstance: create)
    ..m<$core.String, ConfigurationEntryValue>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'fields',
        entryClassName: 'ConfigurationEntryMapValue.FieldsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: ConfigurationEntryValue.create,
        packageName: const $pb.PackageName('liveconfiguration.protobuf'))
    ..hasRequiredFields = false;

  ConfigurationEntryMapValue._() : super();
  factory ConfigurationEntryMapValue({
    $core.Map<$core.String, ConfigurationEntryValue>? fields,
  }) {
    final _result = create();
    if (fields != null) {
      _result.fields.addAll(fields);
    }
    return _result;
  }
  factory ConfigurationEntryMapValue.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConfigurationEntryMapValue.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConfigurationEntryMapValue clone() =>
      ConfigurationEntryMapValue()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConfigurationEntryMapValue copyWith(
          void Function(ConfigurationEntryMapValue) updates) =>
      super.copyWith(
              (message) => updates(message as ConfigurationEntryMapValue))
          as ConfigurationEntryMapValue; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConfigurationEntryMapValue create() => ConfigurationEntryMapValue._();
  ConfigurationEntryMapValue createEmptyInstance() => create();
  static $pb.PbList<ConfigurationEntryMapValue> createRepeated() =>
      $pb.PbList<ConfigurationEntryMapValue>();
  @$core.pragma('dart2js:noInline')
  static ConfigurationEntryMapValue getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConfigurationEntryMapValue>(create);
  static ConfigurationEntryMapValue? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, ConfigurationEntryValue> get fields => $_getMap(0);
}
