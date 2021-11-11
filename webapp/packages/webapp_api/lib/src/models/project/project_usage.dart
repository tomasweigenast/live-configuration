
import 'package:built_value/built_value.dart';
import 'package:webapp_api/src/models/common/period.dart';

part 'project_usage.g.dart';

abstract class ProjectUsage implements Built<ProjectUsage, ProjectUsageBuilder> {
  Period get period;
  int get totalRequests;
  int get requestsPerSecond;
  ProductUsageOperations? get operations;

  ProjectUsage._();

  factory ProjectUsage([void Function(ProjectUsageBuilder) updates]) = _$ProjectUsage;
}

class ProductUsageOperations {
  final int updateOperations;
  final int readOperations;

  ProductUsageOperations({required this.updateOperations, required this.readOperations});
}