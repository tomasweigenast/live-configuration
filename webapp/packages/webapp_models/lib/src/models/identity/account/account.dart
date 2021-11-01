import 'package:built_value/built_value.dart';

part 'account.g.dart';

abstract class Account implements Built<Account, AccountBuilder> {
  String get uid;
  String get firstName;
  String get lastName;
  String get email;
  String get phoneNumber;
  DateTime get registrationAt;
  DateTime? get modifiedAt;

  Account._();

  factory Account([void Function(AccountBuilder) updates]) = _$Account;
}