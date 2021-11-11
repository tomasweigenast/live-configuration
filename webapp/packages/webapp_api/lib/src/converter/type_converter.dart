import 'package:webapp_api/src/api/api_response.converter.dart';
import 'package:webapp_api/src/api/api_response.dart';
import 'package:webapp_api/src/helpers/lazy.dart';
import 'package:webapp_api/src/models/common/period.converter.dart';
import 'package:webapp_api/src/models/common/period.dart';
import 'package:webapp_api/src/models/configuration_entry/configuration_entry.converter.dart';
import 'package:webapp_api/src/models/configuration_entry/configuration_entry.dart';
import 'package:webapp_api/src/models/identity/account/account.converter.dart';
import 'package:webapp_api/src/models/identity/account/account.dart';
import 'package:webapp_api/src/models/identity/organization/organization.converter.dart';
import 'package:webapp_api/src/models/identity/organization/organization.dart';
import 'package:webapp_api/src/models/identity/session/session.converter.dart';
import 'package:webapp_api/src/models/identity/session/session.dart';
import 'package:webapp_api/src/models/project/project.converter.dart';
import 'package:webapp_api/src/models/project/project.dart';
import 'package:webapp_api/src/models/project/project_settings.dart';
import 'package:webapp_api/src/models/project/project_usage.dart';
import 'package:webapp_api/src/models/protos/configuration_entry.pb.dart' as pb0;
import 'package:webapp_api/src/models/protos/identity.pb.dart' as pb0;
import 'package:webapp_api/src/models/protos/project.pb.dart' as pb0;
import 'package:webapp_api/src/models/protos/api.pb.dart' as pb0;
import 'package:webapp_api/src/models/protos/common.pb.dart' as pb0;
import 'package:webapp_api/src/models/protos/organization.pb.dart' as pb0;

abstract class TypeConverter<TInput extends Object, TOutput extends Object> {
  TOutput convertTo(TInput input, TypeConverterCollection converters);
  TInput convertFrom(TOutput output, TypeConverterCollection converters);
}

class TypeConverterCollection {
  static const TypeConverterCollection I = TypeConverterCollection._(); 
  const TypeConverterCollection._();

  static final Map<Type, Lazy<TypeConverter>> _converters = {
    ConfigurationGroup: Lazy<TypeConverter<ConfigurationGroup, pb0.ConfigurationGroup>>(() => ConfigurationGroupConverter()),
    ConfigurationGroupVersion: Lazy<TypeConverter<ConfigurationGroupVersion, pb0.ConfigurationGroupVersion>>(() => ConfigurationGroupVersionConverter()),
    ConfigurationEntry: Lazy<TypeConverter<ConfigurationEntry, pb0.ConfigurationEntry>>(() => ConfigurationEntryConverter()),
    ConfigurationEntryValue: Lazy<TypeConverter<ConfigurationEntryValue, pb0.ConfigurationEntryValue>>(() => ConfigurationEntryValueConverter()),
    ConfigurationEntryValueType: Lazy<TypeConverter<ConfigurationEntryValueType, pb0.ConfigurationEntryValueType>>(() => ConfigurationEntryValueTypeConverter()),

    Account: Lazy<TypeConverter<Account, pb0.Account>>(() => AccountConverter()),
    Session: Lazy<TypeConverter<Session, pb0.Session>>(() => SessionConverter()),

    Project: Lazy<TypeConverter<Project, pb0.Project>>(() => ProjectConverter()),
    ProjectUsage: Lazy<TypeConverter<ProjectUsage, pb0.ProjectUsage>>(() => ProjectUsageConverter()),
    ProjectSettings: Lazy<TypeConverter<ProjectSettings, pb0.ProjectSettings>>(() => ProjectSettingsConverter()),

    PageDetails: Lazy<TypeConverter<PageDetails, pb0.PageDetails>>(() => PageDetailsConverter()),
    Period: Lazy<TypeConverter<Period, pb0.Period>>(() => PeriodConverter()),

    Organization: Lazy<TypeConverter<Organization, pb0.Organization>>(() => OrganizationConverter()),
    OrganizationPolicy: Lazy<TypeConverter<OrganizationPolicy, pb0.OrganizationPolicy>>(() => OrganizationPolicyConverter()),
    OrganizationMember: Lazy<TypeConverter<OrganizationMember, pb0.OrganizationMember>>(() => OrganizationMemberConverter()),
    OrganizationMemberPolicy: Lazy<TypeConverter<OrganizationMemberPolicy, pb0.OrganizationMember_OrganizationMemberAccessPolicy>>(() => OrganizationMemberPolicyConverter()),
  };

  TypeConverter findConverter(Type type) {
    var converter = _converters[type];
    if(converter == null) {
      throw Exception("Converter for type $type not found.");
    }

    return converter();
  }
}