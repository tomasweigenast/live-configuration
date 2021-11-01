// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Organization extends Organization {
  @override
  final String uid;
  @override
  final String name;
  @override
  final String accountUid;
  @override
  final DateTime createdAt;
  @override
  final DateTime? modifiedAt;

  factory _$Organization([void Function(OrganizationBuilder)? updates]) =>
      (new OrganizationBuilder()..update(updates)).build();

  _$Organization._(
      {required this.uid,
      required this.name,
      required this.accountUid,
      required this.createdAt,
      this.modifiedAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(uid, 'Organization', 'uid');
    BuiltValueNullFieldError.checkNotNull(name, 'Organization', 'name');
    BuiltValueNullFieldError.checkNotNull(
        accountUid, 'Organization', 'accountUid');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, 'Organization', 'createdAt');
  }

  @override
  Organization rebuild(void Function(OrganizationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrganizationBuilder toBuilder() => new OrganizationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Organization &&
        uid == other.uid &&
        name == other.name &&
        accountUid == other.accountUid &&
        createdAt == other.createdAt &&
        modifiedAt == other.modifiedAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, uid.hashCode), name.hashCode), accountUid.hashCode),
            createdAt.hashCode),
        modifiedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Organization')
          ..add('uid', uid)
          ..add('name', name)
          ..add('accountUid', accountUid)
          ..add('createdAt', createdAt)
          ..add('modifiedAt', modifiedAt))
        .toString();
  }
}

class OrganizationBuilder
    implements Builder<Organization, OrganizationBuilder> {
  _$Organization? _$v;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _accountUid;
  String? get accountUid => _$this._accountUid;
  set accountUid(String? accountUid) => _$this._accountUid = accountUid;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _$this._modifiedAt;
  set modifiedAt(DateTime? modifiedAt) => _$this._modifiedAt = modifiedAt;

  OrganizationBuilder();

  OrganizationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _name = $v.name;
      _accountUid = $v.accountUid;
      _createdAt = $v.createdAt;
      _modifiedAt = $v.modifiedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Organization other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Organization;
  }

  @override
  void update(void Function(OrganizationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Organization build() {
    final _$result = _$v ??
        new _$Organization._(
            uid: BuiltValueNullFieldError.checkNotNull(
                uid, 'Organization', 'uid'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'Organization', 'name'),
            accountUid: BuiltValueNullFieldError.checkNotNull(
                accountUid, 'Organization', 'accountUid'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, 'Organization', 'createdAt'),
            modifiedAt: modifiedAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
