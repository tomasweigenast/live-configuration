import 'package:flutter/material.dart';
import 'package:webapp_api/webapp_models.dart';

class ProjectProvider extends ChangeNotifier {
  final Project currentProject;

  ProjectProvider({required this.currentProject});

}