import 'package:built_collection/built_collection.dart';
import 'package:webapp_api/src/converter/type_converter.dart';
import 'package:webapp_api/src/helpers/extensions.dart';
import 'package:webapp_api/src/models/identity/organization/organization.dart';
import 'package:webapp_api/src/models/protos/organization.pb.dart' as pb0;

class OrganizationConverter implements TypeConverter<Organization, pb0.Organization> {
  @override
  Organization convertFrom(pb0.Organization output, TypeConverterCollection converters) {
    return Organization((b) => b
      ..uid = output.uid
      ..name = output.name
      ..accountUid = output.accountUid
      ..createdAt = output.createdAt.toDateTime()
      ..modifiedAt = output.hasLastModified() ? output.lastModified.toDateTime() : null
    );
  }

  @override
  pb0.Organization convertTo(Organization input, TypeConverterCollection converters) {
    return pb0.Organization(
      uid: input.uid,
      name: input.name,
      accountUid: input.accountUid,
      createdAt: input.createdAt.toTimestamp(),
      lastModified: input.modifiedAt?.toTimestamp()
    );
  }
  
}

class OrganizationPolicyConverter implements TypeConverter<OrganizationPolicy, pb0.OrganizationPolicy> {
  @override
  OrganizationPolicy convertFrom(pb0.OrganizationPolicy output, TypeConverterCollection converters) {
    return OrganizationPolicy.valueOf(output.value);
  }

  @override
  pb0.OrganizationPolicy convertTo(OrganizationPolicy input, TypeConverterCollection converters) {
    return pb0.OrganizationPolicy.valueOf(input.value) ?? pb0.OrganizationPolicy.ORGANIZATION_MEMBER_POLICY_UNDEFINED;
  }

}

class OrganizationMemberConverter implements TypeConverter<OrganizationMember, pb0.OrganizationMember> {
  @override
  OrganizationMember convertFrom(pb0.OrganizationMember output, TypeConverterCollection converters) {
    return OrganizationMember((b) => b
      ..organizationUid = output.organizationUid
      ..accountUid = output.accountUid
      ..addedDate = output.addedTime.toDateTime()
      ..policy = (OrganizationMemberPolicyBuilder()..replace(converters.findConverter(OrganizationMemberPolicy).convertTo(output.policy, converters) as OrganizationMemberPolicy)) 
    );
  }

  @override
  pb0.OrganizationMember convertTo(OrganizationMember input, TypeConverterCollection converters) {
    return pb0.OrganizationMember(
      organizationUid: input.organizationUid,
      accountUid: input.accountUid,
      addedTime: input.addedDate.toTimestamp(),
      policy: converters.findConverter(OrganizationMemberPolicy).convertFrom(input.policy, converters) as pb0.OrganizationMember_OrganizationMemberAccessPolicy
    );
  }
}

class OrganizationMemberPolicyConverter implements TypeConverter<OrganizationMemberPolicy, pb0.OrganizationMember_OrganizationMemberAccessPolicy> {
  @override
  OrganizationMemberPolicy convertFrom(pb0.OrganizationMember_OrganizationMemberAccessPolicy output, TypeConverterCollection converters) {
    return OrganizationMemberPolicy((b) => b
      ..policy = converters.findConverter(OrganizationPolicy).convertFrom(output.policy, converters) as OrganizationPolicy
      ..projects = ListBuilder(output.project.projectIds)
    );
  }

  @override
  pb0.OrganizationMember_OrganizationMemberAccessPolicy convertTo(OrganizationMemberPolicy input, TypeConverterCollection converters) {
    return pb0.OrganizationMember_OrganizationMemberAccessPolicy(
      policy: converters.findConverter(OrganizationPolicy).convertTo(input.policy, converters) as pb0.OrganizationPolicy,
      project: pb0.OrganizationPolicyProject(
        projectIds: input.projects
      )
    );
  }

}