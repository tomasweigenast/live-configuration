// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Session extends Session {
  @override
  final String uid;
  @override
  final String accountUid;
  @override
  final DateTime generatedAt;
  @override
  final DateTime? modifiedAt;

  factory _$Session([void Function(SessionBuilder)? updates]) =>
      (new SessionBuilder()..update(updates)).build();

  _$Session._(
      {required this.uid,
      required this.accountUid,
      required this.generatedAt,
      this.modifiedAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(uid, 'Session', 'uid');
    BuiltValueNullFieldError.checkNotNull(accountUid, 'Session', 'accountUid');
    BuiltValueNullFieldError.checkNotNull(
        generatedAt, 'Session', 'generatedAt');
  }

  @override
  Session rebuild(void Function(SessionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SessionBuilder toBuilder() => new SessionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Session &&
        uid == other.uid &&
        accountUid == other.accountUid &&
        generatedAt == other.generatedAt &&
        modifiedAt == other.modifiedAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, uid.hashCode), accountUid.hashCode),
            generatedAt.hashCode),
        modifiedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Session')
          ..add('uid', uid)
          ..add('accountUid', accountUid)
          ..add('generatedAt', generatedAt)
          ..add('modifiedAt', modifiedAt))
        .toString();
  }
}

class SessionBuilder implements Builder<Session, SessionBuilder> {
  _$Session? _$v;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  String? _accountUid;
  String? get accountUid => _$this._accountUid;
  set accountUid(String? accountUid) => _$this._accountUid = accountUid;

  DateTime? _generatedAt;
  DateTime? get generatedAt => _$this._generatedAt;
  set generatedAt(DateTime? generatedAt) => _$this._generatedAt = generatedAt;

  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _$this._modifiedAt;
  set modifiedAt(DateTime? modifiedAt) => _$this._modifiedAt = modifiedAt;

  SessionBuilder();

  SessionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _accountUid = $v.accountUid;
      _generatedAt = $v.generatedAt;
      _modifiedAt = $v.modifiedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Session other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Session;
  }

  @override
  void update(void Function(SessionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Session build() {
    final _$result = _$v ??
        new _$Session._(
            uid: BuiltValueNullFieldError.checkNotNull(uid, 'Session', 'uid'),
            accountUid: BuiltValueNullFieldError.checkNotNull(
                accountUid, 'Session', 'accountUid'),
            generatedAt: BuiltValueNullFieldError.checkNotNull(
                generatedAt, 'Session', 'generatedAt'),
            modifiedAt: modifiedAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
