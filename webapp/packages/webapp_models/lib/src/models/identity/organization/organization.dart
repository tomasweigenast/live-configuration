import 'package:built_value/built_value.dart';

part 'organization.g.dart';

abstract class Organization implements Built<Organization, OrganizationBuilder> {
  String get uid;
  String get name;
  String get accountUid;
  DateTime get createdAt;
  DateTime? get modifiedAt;

  Organization._();
  factory Organization([void Function(OrganizationBuilder)? updates]) = _$Organization;
}