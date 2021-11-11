import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webapp/ui/providers/project_provider.dart';
import 'package:webapp_api/webapp_models.dart';

class ProjectOverviewView extends StatefulWidget {
  const ProjectOverviewView({ Key? key }) : super(key: key);

  @override
  _ProjectOverviewViewState createState() => _ProjectOverviewViewState();
}

class _ProjectOverviewViewState extends State<ProjectOverviewView> {

  late final Project project;

  @override
  void initState() {
    super.initState();

    project = context.read<ProjectProvider>().currentProject;
  }
  
  @override
  Widget build(BuildContext context) {
    return Text("Project name: ${project.name}");
  }
}