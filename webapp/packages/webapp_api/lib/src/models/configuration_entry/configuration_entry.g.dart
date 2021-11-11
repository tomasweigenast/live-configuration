// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_entry.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ConfigurationEntryValueType _$nil =
    const ConfigurationEntryValueType._('nil');
const ConfigurationEntryValueType _$bool =
    const ConfigurationEntryValueType._('bool');
const ConfigurationEntryValueType _$string =
    const ConfigurationEntryValueType._('string');
const ConfigurationEntryValueType _$int =
    const ConfigurationEntryValueType._('int');
const ConfigurationEntryValueType _$double =
    const ConfigurationEntryValueType._('double');
const ConfigurationEntryValueType _$timestamp =
    const ConfigurationEntryValueType._('timestamp');
const ConfigurationEntryValueType _$duration =
    const ConfigurationEntryValueType._('duration');
const ConfigurationEntryValueType _$list =
    const ConfigurationEntryValueType._('list');
const ConfigurationEntryValueType _$map =
    const ConfigurationEntryValueType._('map');
const ConfigurationEntryValueType _$rawJson =
    const ConfigurationEntryValueType._('rawJson');
const ConfigurationEntryValueType _$blob =
    const ConfigurationEntryValueType._('blob');

ConfigurationEntryValueType _$valueOf(String name) {
  switch (name) {
    case 'nil':
      return _$nil;
    case 'bool':
      return _$bool;
    case 'string':
      return _$string;
    case 'int':
      return _$int;
    case 'double':
      return _$double;
    case 'timestamp':
      return _$timestamp;
    case 'duration':
      return _$duration;
    case 'list':
      return _$list;
    case 'map':
      return _$map;
    case 'rawJson':
      return _$rawJson;
    case 'blob':
      return _$blob;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ConfigurationEntryValueType> _$values = new BuiltSet<
    ConfigurationEntryValueType>(const <ConfigurationEntryValueType>[
  _$nil,
  _$bool,
  _$string,
  _$int,
  _$double,
  _$timestamp,
  _$duration,
  _$list,
  _$map,
  _$rawJson,
  _$blob,
]);

class _$ConfigurationGroup extends ConfigurationGroup {
  @override
  final String uid;
  @override
  final String name;
  @override
  final String? description;
  @override
  final DateTime createdAt;
  @override
  final DateTime? modifiedAt;
  @override
  final int entriesCount;
  @override
  final int currentVersion;

  factory _$ConfigurationGroup(
          [void Function(ConfigurationGroupBuilder)? updates]) =>
      (new ConfigurationGroupBuilder()..update(updates)).build();

  _$ConfigurationGroup._(
      {required this.uid,
      required this.name,
      this.description,
      required this.createdAt,
      this.modifiedAt,
      required this.entriesCount,
      required this.currentVersion})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(uid, 'ConfigurationGroup', 'uid');
    BuiltValueNullFieldError.checkNotNull(name, 'ConfigurationGroup', 'name');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, 'ConfigurationGroup', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        entriesCount, 'ConfigurationGroup', 'entriesCount');
    BuiltValueNullFieldError.checkNotNull(
        currentVersion, 'ConfigurationGroup', 'currentVersion');
  }

  @override
  ConfigurationGroup rebuild(
          void Function(ConfigurationGroupBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigurationGroupBuilder toBuilder() =>
      new ConfigurationGroupBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfigurationGroup &&
        uid == other.uid &&
        name == other.name &&
        description == other.description &&
        createdAt == other.createdAt &&
        modifiedAt == other.modifiedAt &&
        entriesCount == other.entriesCount &&
        currentVersion == other.currentVersion;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, uid.hashCode), name.hashCode),
                        description.hashCode),
                    createdAt.hashCode),
                modifiedAt.hashCode),
            entriesCount.hashCode),
        currentVersion.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ConfigurationGroup')
          ..add('uid', uid)
          ..add('name', name)
          ..add('description', description)
          ..add('createdAt', createdAt)
          ..add('modifiedAt', modifiedAt)
          ..add('entriesCount', entriesCount)
          ..add('currentVersion', currentVersion))
        .toString();
  }
}

class ConfigurationGroupBuilder
    implements Builder<ConfigurationGroup, ConfigurationGroupBuilder> {
  _$ConfigurationGroup? _$v;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _$this._modifiedAt;
  set modifiedAt(DateTime? modifiedAt) => _$this._modifiedAt = modifiedAt;

  int? _entriesCount;
  int? get entriesCount => _$this._entriesCount;
  set entriesCount(int? entriesCount) => _$this._entriesCount = entriesCount;

  int? _currentVersion;
  int? get currentVersion => _$this._currentVersion;
  set currentVersion(int? currentVersion) =>
      _$this._currentVersion = currentVersion;

  ConfigurationGroupBuilder();

  ConfigurationGroupBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _name = $v.name;
      _description = $v.description;
      _createdAt = $v.createdAt;
      _modifiedAt = $v.modifiedAt;
      _entriesCount = $v.entriesCount;
      _currentVersion = $v.currentVersion;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConfigurationGroup other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConfigurationGroup;
  }

  @override
  void update(void Function(ConfigurationGroupBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ConfigurationGroup build() {
    final _$result = _$v ??
        new _$ConfigurationGroup._(
            uid: BuiltValueNullFieldError.checkNotNull(
                uid, 'ConfigurationGroup', 'uid'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'ConfigurationGroup', 'name'),
            description: description,
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, 'ConfigurationGroup', 'createdAt'),
            modifiedAt: modifiedAt,
            entriesCount: BuiltValueNullFieldError.checkNotNull(
                entriesCount, 'ConfigurationGroup', 'entriesCount'),
            currentVersion: BuiltValueNullFieldError.checkNotNull(
                currentVersion, 'ConfigurationGroup', 'currentVersion'));
    replace(_$result);
    return _$result;
  }
}

class _$ConfigurationGroupVersion extends ConfigurationGroupVersion {
  @override
  final String groupUid;
  @override
  final int version;
  @override
  final DateTime createdAt;
  @override
  final DateTime? publishAt;

  factory _$ConfigurationGroupVersion(
          [void Function(ConfigurationGroupVersionBuilder)? updates]) =>
      (new ConfigurationGroupVersionBuilder()..update(updates)).build();

  _$ConfigurationGroupVersion._(
      {required this.groupUid,
      required this.version,
      required this.createdAt,
      this.publishAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        groupUid, 'ConfigurationGroupVersion', 'groupUid');
    BuiltValueNullFieldError.checkNotNull(
        version, 'ConfigurationGroupVersion', 'version');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, 'ConfigurationGroupVersion', 'createdAt');
  }

  @override
  ConfigurationGroupVersion rebuild(
          void Function(ConfigurationGroupVersionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigurationGroupVersionBuilder toBuilder() =>
      new ConfigurationGroupVersionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfigurationGroupVersion &&
        groupUid == other.groupUid &&
        version == other.version &&
        createdAt == other.createdAt &&
        publishAt == other.publishAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, groupUid.hashCode), version.hashCode),
            createdAt.hashCode),
        publishAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ConfigurationGroupVersion')
          ..add('groupUid', groupUid)
          ..add('version', version)
          ..add('createdAt', createdAt)
          ..add('publishAt', publishAt))
        .toString();
  }
}

class ConfigurationGroupVersionBuilder
    implements
        Builder<ConfigurationGroupVersion, ConfigurationGroupVersionBuilder> {
  _$ConfigurationGroupVersion? _$v;

  String? _groupUid;
  String? get groupUid => _$this._groupUid;
  set groupUid(String? groupUid) => _$this._groupUid = groupUid;

  int? _version;
  int? get version => _$this._version;
  set version(int? version) => _$this._version = version;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _publishAt;
  DateTime? get publishAt => _$this._publishAt;
  set publishAt(DateTime? publishAt) => _$this._publishAt = publishAt;

  ConfigurationGroupVersionBuilder();

  ConfigurationGroupVersionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _groupUid = $v.groupUid;
      _version = $v.version;
      _createdAt = $v.createdAt;
      _publishAt = $v.publishAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConfigurationGroupVersion other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConfigurationGroupVersion;
  }

  @override
  void update(void Function(ConfigurationGroupVersionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ConfigurationGroupVersion build() {
    final _$result = _$v ??
        new _$ConfigurationGroupVersion._(
            groupUid: BuiltValueNullFieldError.checkNotNull(
                groupUid, 'ConfigurationGroupVersion', 'groupUid'),
            version: BuiltValueNullFieldError.checkNotNull(
                version, 'ConfigurationGroupVersion', 'version'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, 'ConfigurationGroupVersion', 'createdAt'),
            publishAt: publishAt);
    replace(_$result);
    return _$result;
  }
}

class _$ConfigurationEntry extends ConfigurationEntry {
  @override
  final String key;
  @override
  final String name;
  @override
  final String? description;
  @override
  final DateTime createdAt;
  @override
  final DateTime? modifiedAt;
  @override
  final ConfigurationEntryValue value;

  factory _$ConfigurationEntry(
          [void Function(ConfigurationEntryBuilder)? updates]) =>
      (new ConfigurationEntryBuilder()..update(updates)).build();

  _$ConfigurationEntry._(
      {required this.key,
      required this.name,
      this.description,
      required this.createdAt,
      this.modifiedAt,
      required this.value})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(key, 'ConfigurationEntry', 'key');
    BuiltValueNullFieldError.checkNotNull(name, 'ConfigurationEntry', 'name');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, 'ConfigurationEntry', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(value, 'ConfigurationEntry', 'value');
  }

  @override
  ConfigurationEntry rebuild(
          void Function(ConfigurationEntryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigurationEntryBuilder toBuilder() =>
      new ConfigurationEntryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfigurationEntry &&
        key == other.key &&
        name == other.name &&
        description == other.description &&
        createdAt == other.createdAt &&
        modifiedAt == other.modifiedAt &&
        value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, key.hashCode), name.hashCode),
                    description.hashCode),
                createdAt.hashCode),
            modifiedAt.hashCode),
        value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ConfigurationEntry')
          ..add('key', key)
          ..add('name', name)
          ..add('description', description)
          ..add('createdAt', createdAt)
          ..add('modifiedAt', modifiedAt)
          ..add('value', value))
        .toString();
  }
}

class ConfigurationEntryBuilder
    implements Builder<ConfigurationEntry, ConfigurationEntryBuilder> {
  _$ConfigurationEntry? _$v;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _$this._modifiedAt;
  set modifiedAt(DateTime? modifiedAt) => _$this._modifiedAt = modifiedAt;

  ConfigurationEntryValueBuilder? _value;
  ConfigurationEntryValueBuilder get value =>
      _$this._value ??= new ConfigurationEntryValueBuilder();
  set value(ConfigurationEntryValueBuilder? value) => _$this._value = value;

  ConfigurationEntryBuilder();

  ConfigurationEntryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _key = $v.key;
      _name = $v.name;
      _description = $v.description;
      _createdAt = $v.createdAt;
      _modifiedAt = $v.modifiedAt;
      _value = $v.value.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConfigurationEntry other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConfigurationEntry;
  }

  @override
  void update(void Function(ConfigurationEntryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ConfigurationEntry build() {
    _$ConfigurationEntry _$result;
    try {
      _$result = _$v ??
          new _$ConfigurationEntry._(
              key: BuiltValueNullFieldError.checkNotNull(
                  key, 'ConfigurationEntry', 'key'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, 'ConfigurationEntry', 'name'),
              description: description,
              createdAt: BuiltValueNullFieldError.checkNotNull(
                  createdAt, 'ConfigurationEntry', 'createdAt'),
              modifiedAt: modifiedAt,
              value: value.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'value';
        value.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ConfigurationEntry', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ConfigurationEntryValue extends ConfigurationEntryValue {
  @override
  final ConfigurationEntryValueType valueType;
  @override
  final Object? value;

  factory _$ConfigurationEntryValue(
          [void Function(ConfigurationEntryValueBuilder)? updates]) =>
      (new ConfigurationEntryValueBuilder()..update(updates)).build();

  _$ConfigurationEntryValue._({required this.valueType, this.value})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        valueType, 'ConfigurationEntryValue', 'valueType');
  }

  @override
  ConfigurationEntryValue rebuild(
          void Function(ConfigurationEntryValueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigurationEntryValueBuilder toBuilder() =>
      new ConfigurationEntryValueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfigurationEntryValue &&
        valueType == other.valueType &&
        value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, valueType.hashCode), value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ConfigurationEntryValue')
          ..add('valueType', valueType)
          ..add('value', value))
        .toString();
  }
}

class ConfigurationEntryValueBuilder
    implements
        Builder<ConfigurationEntryValue, ConfigurationEntryValueBuilder> {
  _$ConfigurationEntryValue? _$v;

  ConfigurationEntryValueType? _valueType;
  ConfigurationEntryValueType? get valueType => _$this._valueType;
  set valueType(ConfigurationEntryValueType? valueType) =>
      _$this._valueType = valueType;

  Object? _value;
  Object? get value => _$this._value;
  set value(Object? value) => _$this._value = value;

  ConfigurationEntryValueBuilder();

  ConfigurationEntryValueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _valueType = $v.valueType;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConfigurationEntryValue other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConfigurationEntryValue;
  }

  @override
  void update(void Function(ConfigurationEntryValueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ConfigurationEntryValue build() {
    final _$result = _$v ??
        new _$ConfigurationEntryValue._(
            valueType: BuiltValueNullFieldError.checkNotNull(
                valueType, 'ConfigurationEntryValue', 'valueType'),
            value: value);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
