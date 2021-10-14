import 'package:flutter/material.dart';
import 'package:webapp/domain/models/project.dart';

class ProjectProvider extends ChangeNotifier {
  final Project currentProject;

  ProjectProvider({required this.currentProject});

}