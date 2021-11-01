// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Account extends Account {
  @override
  final String uid;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  final DateTime registrationAt;
  @override
  final DateTime? modifiedAt;

  factory _$Account([void Function(AccountBuilder)? updates]) =>
      (new AccountBuilder()..update(updates)).build();

  _$Account._(
      {required this.uid,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.registrationAt,
      this.modifiedAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(uid, 'Account', 'uid');
    BuiltValueNullFieldError.checkNotNull(firstName, 'Account', 'firstName');
    BuiltValueNullFieldError.checkNotNull(lastName, 'Account', 'lastName');
    BuiltValueNullFieldError.checkNotNull(email, 'Account', 'email');
    BuiltValueNullFieldError.checkNotNull(
        phoneNumber, 'Account', 'phoneNumber');
    BuiltValueNullFieldError.checkNotNull(
        registrationAt, 'Account', 'registrationAt');
  }

  @override
  Account rebuild(void Function(AccountBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountBuilder toBuilder() => new AccountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Account &&
        uid == other.uid &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        email == other.email &&
        phoneNumber == other.phoneNumber &&
        registrationAt == other.registrationAt &&
        modifiedAt == other.modifiedAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, uid.hashCode), firstName.hashCode),
                        lastName.hashCode),
                    email.hashCode),
                phoneNumber.hashCode),
            registrationAt.hashCode),
        modifiedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Account')
          ..add('uid', uid)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('email', email)
          ..add('phoneNumber', phoneNumber)
          ..add('registrationAt', registrationAt)
          ..add('modifiedAt', modifiedAt))
        .toString();
  }
}

class AccountBuilder implements Builder<Account, AccountBuilder> {
  _$Account? _$v;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  DateTime? _registrationAt;
  DateTime? get registrationAt => _$this._registrationAt;
  set registrationAt(DateTime? registrationAt) =>
      _$this._registrationAt = registrationAt;

  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _$this._modifiedAt;
  set modifiedAt(DateTime? modifiedAt) => _$this._modifiedAt = modifiedAt;

  AccountBuilder();

  AccountBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _email = $v.email;
      _phoneNumber = $v.phoneNumber;
      _registrationAt = $v.registrationAt;
      _modifiedAt = $v.modifiedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Account other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Account;
  }

  @override
  void update(void Function(AccountBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Account build() {
    final _$result = _$v ??
        new _$Account._(
            uid: BuiltValueNullFieldError.checkNotNull(uid, 'Account', 'uid'),
            firstName: BuiltValueNullFieldError.checkNotNull(
                firstName, 'Account', 'firstName'),
            lastName: BuiltValueNullFieldError.checkNotNull(
                lastName, 'Account', 'lastName'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, 'Account', 'email'),
            phoneNumber: BuiltValueNullFieldError.checkNotNull(
                phoneNumber, 'Account', 'phoneNumber'),
            registrationAt: BuiltValueNullFieldError.checkNotNull(
                registrationAt, 'Account', 'registrationAt'),
            modifiedAt: modifiedAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
