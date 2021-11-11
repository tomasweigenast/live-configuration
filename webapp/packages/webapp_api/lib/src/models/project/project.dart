import 'package:built_value/built_value.dart';

part 'project.g.dart';

abstract class Project implements Built<Project, ProjectBuilder> {
  String get uid;
  String get name;
  String get organizationUid;
  DateTime get createdAt;
  DateTime? get modifiedAt;
  bool get isFavorited;

  Project._();

  factory Project([void Function(ProjectBuilder) updates]) = _$Project;
}