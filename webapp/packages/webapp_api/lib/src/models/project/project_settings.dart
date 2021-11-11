
import 'package:built_value/built_value.dart';

part 'project_settings.g.dart';

abstract class ProjectSettings implements Built<ProjectSettings, ProjectSettingsBuilder> {
  bool get enabled;

  ProjectSettings._();

  factory ProjectSettings([void Function(ProjectSettingsBuilder) updates]) = _$ProjectSettings;
}