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

class _$OrganizationMember extends OrganizationMember {
  @override
  final String organizationUid;
  @override
  final String accountUid;
  @override
  final DateTime addedDate;
  @override
  final OrganizationMemberPolicy policy;

  factory _$OrganizationMember(
          [void Function(OrganizationMemberBuilder)? updates]) =>
      (new OrganizationMemberBuilder()..update(updates)).build();

  _$OrganizationMember._(
      {required this.organizationUid,
      required this.accountUid,
      required this.addedDate,
      required this.policy})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        organizationUid, 'OrganizationMember', 'organizationUid');
    BuiltValueNullFieldError.checkNotNull(
        accountUid, 'OrganizationMember', 'accountUid');
    BuiltValueNullFieldError.checkNotNull(
        addedDate, 'OrganizationMember', 'addedDate');
    BuiltValueNullFieldError.checkNotNull(
        policy, 'OrganizationMember', 'policy');
  }

  @override
  OrganizationMember rebuild(
          void Function(OrganizationMemberBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrganizationMemberBuilder toBuilder() =>
      new OrganizationMemberBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrganizationMember &&
        organizationUid == other.organizationUid &&
        accountUid == other.accountUid &&
        addedDate == other.addedDate &&
        policy == other.policy;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, organizationUid.hashCode), accountUid.hashCode),
            addedDate.hashCode),
        policy.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OrganizationMember')
          ..add('organizationUid', organizationUid)
          ..add('accountUid', accountUid)
          ..add('addedDate', addedDate)
          ..add('policy', policy))
        .toString();
  }
}

class OrganizationMemberBuilder
    implements Builder<OrganizationMember, OrganizationMemberBuilder> {
  _$OrganizationMember? _$v;

  String? _organizationUid;
  String? get organizationUid => _$this._organizationUid;
  set organizationUid(String? organizationUid) =>
      _$this._organizationUid = organizationUid;

  String? _accountUid;
  String? get accountUid => _$this._accountUid;
  set accountUid(String? accountUid) => _$this._accountUid = accountUid;

  DateTime? _addedDate;
  DateTime? get addedDate => _$this._addedDate;
  set addedDate(DateTime? addedDate) => _$this._addedDate = addedDate;

  OrganizationMemberPolicyBuilder? _policy;
  OrganizationMemberPolicyBuilder get policy =>
      _$this._policy ??= new OrganizationMemberPolicyBuilder();
  set policy(OrganizationMemberPolicyBuilder? policy) =>
      _$this._policy = policy;

  OrganizationMemberBuilder();

  OrganizationMemberBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _organizationUid = $v.organizationUid;
      _accountUid = $v.accountUid;
      _addedDate = $v.addedDate;
      _policy = $v.policy.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrganizationMember other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrganizationMember;
  }

  @override
  void update(void Function(OrganizationMemberBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OrganizationMember build() {
    _$OrganizationMember _$result;
    try {
      _$result = _$v ??
          new _$OrganizationMember._(
              organizationUid: BuiltValueNullFieldError.checkNotNull(
                  organizationUid, 'OrganizationMember', 'organizationUid'),
              accountUid: BuiltValueNullFieldError.checkNotNull(
                  accountUid, 'OrganizationMember', 'accountUid'),
              addedDate: BuiltValueNullFieldError.checkNotNull(
                  addedDate, 'OrganizationMember', 'addedDate'),
              policy: policy.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'policy';
        policy.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'OrganizationMember', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$OrganizationMemberPolicy extends OrganizationMemberPolicy {
  @override
  final OrganizationPolicy policy;
  @override
  final BuiltList<String> projects;

  factory _$OrganizationMemberPolicy(
          [void Function(OrganizationMemberPolicyBuilder)? updates]) =>
      (new OrganizationMemberPolicyBuilder()..update(updates)).build();

  _$OrganizationMemberPolicy._({required this.policy, required this.projects})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        policy, 'OrganizationMemberPolicy', 'policy');
    BuiltValueNullFieldError.checkNotNull(
        projects, 'OrganizationMemberPolicy', 'projects');
  }

  @override
  OrganizationMemberPolicy rebuild(
          void Function(OrganizationMemberPolicyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrganizationMemberPolicyBuilder toBuilder() =>
      new OrganizationMemberPolicyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrganizationMemberPolicy &&
        policy == other.policy &&
        projects == other.projects;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, policy.hashCode), projects.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OrganizationMemberPolicy')
          ..add('policy', policy)
          ..add('projects', projects))
        .toString();
  }
}

class OrganizationMemberPolicyBuilder
    implements
        Builder<OrganizationMemberPolicy, OrganizationMemberPolicyBuilder> {
  _$OrganizationMemberPolicy? _$v;

  OrganizationPolicy? _policy;
  OrganizationPolicy? get policy => _$this._policy;
  set policy(OrganizationPolicy? policy) => _$this._policy = policy;

  ListBuilder<String>? _projects;
  ListBuilder<String> get projects =>
      _$this._projects ??= new ListBuilder<String>();
  set projects(ListBuilder<String>? projects) => _$this._projects = projects;

  OrganizationMemberPolicyBuilder();

  OrganizationMemberPolicyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _policy = $v.policy;
      _projects = $v.projects.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrganizationMemberPolicy other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrganizationMemberPolicy;
  }

  @override
  void update(void Function(OrganizationMemberPolicyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OrganizationMemberPolicy build() {
    _$OrganizationMemberPolicy _$result;
    try {
      _$result = _$v ??
          new _$OrganizationMemberPolicy._(
              policy: BuiltValueNullFieldError.checkNotNull(
                  policy, 'OrganizationMemberPolicy', 'policy'),
              projects: projects.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'projects';
        projects.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'OrganizationMemberPolicy', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
