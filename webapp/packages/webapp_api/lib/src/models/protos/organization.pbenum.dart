///
//  Generated code. Do not modify.
//  source: organization.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class OrganizationPolicy extends $pb.ProtobufEnum {
  static const OrganizationPolicy ORGANIZATION_MEMBER_POLICY_UNDEFINED = OrganizationPolicy._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ORGANIZATION_MEMBER_POLICY_UNDEFINED');
  static const OrganizationPolicy ORGANIZATION_MEMBER_POLICY_OWNER = OrganizationPolicy._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ORGANIZATION_MEMBER_POLICY_OWNER');
  static const OrganizationPolicy ORGANIZATION_MEMBER_POLICY_ADMINISTRATOR = OrganizationPolicy._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ORGANIZATION_MEMBER_POLICY_ADMINISTRATOR');
  static const OrganizationPolicy ORGANIZATION_MEMBER_POLICY_EDITOR = OrganizationPolicy._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ORGANIZATION_MEMBER_POLICY_EDITOR');
  static const OrganizationPolicy ORGANIZATION_MEMBER_POLICY_SUPERVISOR = OrganizationPolicy._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ORGANIZATION_MEMBER_POLICY_SUPERVISOR');

  static const $core.List<OrganizationPolicy> values = <OrganizationPolicy> [
    ORGANIZATION_MEMBER_POLICY_UNDEFINED,
    ORGANIZATION_MEMBER_POLICY_OWNER,
    ORGANIZATION_MEMBER_POLICY_ADMINISTRATOR,
    ORGANIZATION_MEMBER_POLICY_EDITOR,
    ORGANIZATION_MEMBER_POLICY_SUPERVISOR,
  ];

  static final $core.Map<$core.int, OrganizationPolicy> _byValue = $pb.ProtobufEnum.initByValue(values);
  static OrganizationPolicy? valueOf($core.int value) => _byValue[value];

  const OrganizationPolicy._($core.int v, $core.String n) : super(v, n);
}

