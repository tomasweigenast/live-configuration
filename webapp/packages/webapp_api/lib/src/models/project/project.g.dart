// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Project extends Project {
  @override
  final String uid;
  @override
  final String name;
  @override
  final String organizationUid;
  @override
  final DateTime createdAt;
  @override
  final DateTime? modifiedAt;
  @override
  final bool isFavorited;

  factory _$Project([void Function(ProjectBuilder)? updates]) =>
      (new ProjectBuilder()..update(updates)).build();

  _$Project._(
      {required this.uid,
      required this.name,
      required this.organizationUid,
      required this.createdAt,
      this.modifiedAt,
      required this.isFavorited})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(uid, 'Project', 'uid');
    BuiltValueNullFieldError.checkNotNull(name, 'Project', 'name');
    BuiltValueNullFieldError.checkNotNull(
        organizationUid, 'Project', 'organizationUid');
    BuiltValueNullFieldError.checkNotNull(createdAt, 'Project', 'createdAt');
    BuiltValueNullFieldError.checkNotNull(
        isFavorited, 'Project', 'isFavorited');
  }

  @override
  Project rebuild(void Function(ProjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProjectBuilder toBuilder() => new ProjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Project &&
        uid == other.uid &&
        name == other.name &&
        organizationUid == other.organizationUid &&
        createdAt == other.createdAt &&
        modifiedAt == other.modifiedAt &&
        isFavorited == other.isFavorited;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, uid.hashCode), name.hashCode),
                    organizationUid.hashCode),
                createdAt.hashCode),
            modifiedAt.hashCode),
        isFavorited.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Project')
          ..add('uid', uid)
          ..add('name', name)
          ..add('organizationUid', organizationUid)
          ..add('createdAt', createdAt)
          ..add('modifiedAt', modifiedAt)
          ..add('isFavorited', isFavorited))
        .toString();
  }
}

class ProjectBuilder implements Builder<Project, ProjectBuilder> {
  _$Project? _$v;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _organizationUid;
  String? get organizationUid => _$this._organizationUid;
  set organizationUid(String? organizationUid) =>
      _$this._organizationUid = organizationUid;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _$this._modifiedAt;
  set modifiedAt(DateTime? modifiedAt) => _$this._modifiedAt = modifiedAt;

  bool? _isFavorited;
  bool? get isFavorited => _$this._isFavorited;
  set isFavorited(bool? isFavorited) => _$this._isFavorited = isFavorited;

  ProjectBuilder();

  ProjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _name = $v.name;
      _organizationUid = $v.organizationUid;
      _createdAt = $v.createdAt;
      _modifiedAt = $v.modifiedAt;
      _isFavorited = $v.isFavorited;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Project other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Project;
  }

  @override
  void update(void Function(ProjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Project build() {
    final _$result = _$v ??
        new _$Project._(
            uid: BuiltValueNullFieldError.checkNotNull(uid, 'Project', 'uid'),
            name:
                BuiltValueNullFieldError.checkNotNull(name, 'Project', 'name'),
            organizationUid: BuiltValueNullFieldError.checkNotNull(
                organizationUid, 'Project', 'organizationUid'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, 'Project', 'createdAt'),
            modifiedAt: modifiedAt,
            isFavorited: BuiltValueNullFieldError.checkNotNull(
                isFavorited, 'Project', 'isFavorited'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
