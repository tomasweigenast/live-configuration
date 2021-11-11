import 'package:built_collection/built_collection.dart';
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

class OrganizationPolicy {
  final int _value;
  final String _name;

  int get value => _value;
  String get name => _name;

  const OrganizationPolicy._internal(this._name, this._value);

  static const OrganizationPolicy owner = OrganizationPolicy._internal("owner", 1);
  static const OrganizationPolicy administrator = OrganizationPolicy._internal("administrator", 2);
  static const OrganizationPolicy editor = OrganizationPolicy._internal("editor", 3);
  static const OrganizationPolicy supervisor = OrganizationPolicy._internal("supervisor", 4);

  static const Map<int, OrganizationPolicy> _policiesByValue = {
    1: owner,
    2: administrator,
    3: editor,
    4: supervisor
  };

  static const Map<String, OrganizationPolicy> _policiesByName = {
    "owner": owner,
    "administrator": administrator,
    "editor": editor,
    "supervisor": supervisor
  };

  static Set<OrganizationPolicy> get values => _policiesByValue.values.toSet();

  factory OrganizationPolicy.fromJson(Object? json) {
    try {
      if(json is String) {
        return _policiesByName[json]!;
      } else if(json is int) {
        return _policiesByValue[json]!;
      } else {
        throw "";
      }
    } catch(_) {
      throw Exception("Unable to find an OrganizationPolicy with value $json");
    }
  }

  static OrganizationPolicy valueOf(int value) {
    return _policiesByValue[value]!;
  }
}

abstract class OrganizationMember implements Built<OrganizationMember, OrganizationMemberBuilder> {
  String get organizationUid;
  String get accountUid;
  DateTime get addedDate;
  OrganizationMemberPolicy get policy;

  OrganizationMember._();
  factory OrganizationMember([void Function(OrganizationMemberBuilder)? updates]) = _$OrganizationMember;
}

abstract class OrganizationMemberPolicy implements Built<OrganizationMemberPolicy, OrganizationMemberPolicyBuilder> {
  OrganizationPolicy get policy;
  BuiltList<String> get projects;

  OrganizationMemberPolicy._();
  factory OrganizationMemberPolicy([void Function(OrganizationMemberPolicyBuilder)? updates]) = _$OrganizationMemberPolicy;
}