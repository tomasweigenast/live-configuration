import 'package:webapp_api/src/converter/type_converter.dart';
import 'package:webapp_api/src/helpers/extensions.dart';

import 'package:webapp_api/src/models/protos/project.pb.dart' as pb0;
import 'package:webapp_api/webapp_models.dart';

class ProjectConverter implements TypeConverter<Project, pb0.Project> {
  @override
  Project convertFrom(pb0.Project output, TypeConverterCollection converters) {
    return Project((b) => b
      ..uid = output.uid
      ..name = output.name
      ..organizationUid = output.organizationUid
      ..createdAt = output.createdAt.toDateTime()
      ..modifiedAt = output.hasModifiedAt() ? output.modifiedAt.toDateTime() : null
    );
  }

  @override
  pb0.Project convertTo(Project input, TypeConverterCollection converters) {
    return pb0.Project(
      uid: input.uid,
      name: input.name,
      organizationUid: input.organizationUid,
      createdAt: input.createdAt.toTimestamp(),
      modifiedAt: input.modifiedAt?.toTimestamp()
    );
  }
}

class ProjectSettingsConverter implements TypeConverter<ProjectSettings, pb0.ProjectSettings> {
  @override
  ProjectSettings convertFrom(pb0.ProjectSettings output, TypeConverterCollection converters) {
    return ProjectSettings((b) => b
      ..enabled = output.enabled
    );
  }

  @override
  pb0.ProjectSettings convertTo(ProjectSettings input, TypeConverterCollection converters) {
    return pb0.ProjectSettings(
      enabled: input.enabled
    );
  }
}

class ProjectUsageConverter implements TypeConverter<ProjectUsage, pb0.ProjectUsage> {
  @override
  ProjectUsage convertFrom(pb0.ProjectUsage output, TypeConverterCollection converters) {
    return ProjectUsage();
  }

  @override
  pb0.ProjectUsage convertTo(ProjectUsage input, TypeConverterCollection converters) {
    return pb0.ProjectUsage();
  }
}