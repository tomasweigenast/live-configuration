import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webapp/domain/app/services/projects_service/mock_project_service.dart';
import 'package:webapp/domain/models/project.dart';
import 'package:webapp/domain/navigation/app_router.gr.dart';
import 'package:webapp/helpers/constants.dart';
import 'package:webapp/ui/controls/loader.dart';
import 'package:webapp/ui/providers/project_provider.dart';

class ProjectViewWrapper extends StatefulWidget {

  final String projectId;

  const ProjectViewWrapper({@PathParam("projectId") required this.projectId, Key? key }) : super(key: key);

  @override
  _ProjectViewWrapperState createState() => _ProjectViewWrapperState();
}

class _ProjectViewWrapperState extends State<ProjectViewWrapper> with SingleTickerProviderStateMixin {

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double horizontalPadding = MediaQuery.of(context).size.width / 6;
    return Loader<Project>(
      future: MockProjectService().findProject(widget.projectId),
      onNull: (context) => const Text("Project not found"),
      loaderText: "Searching your project...",
      onFinish: (context, project) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Divider(height: 1),
          Container(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            color: const Color(0xfff2f4ff),
            constraints: const BoxConstraints(
              minHeight: 60
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(Icons.desktop_windows, color: kSecondaryDarkColor, size: 20),
                        SizedBox(width: 10),
                        Text("My projects", style: TextStyle(fontSize: 18, color: kSecondaryDarkColor)),
                      ],
                    ),
                    onTap: () {
                      context.router.pushAndPopUntil(const SelectProjectRoute(), predicate: (x) => x.settings.name == "/home");
                    },
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.arrow_forward_ios_rounded, color: kSecondaryDarkColor, size: 20),
                const SizedBox(width: 10),
                Text(widget.projectId, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ]
            )
          ),
          const Divider(height: 1),
          Expanded(
            child: AutoTabsRouter(
              lazyLoad: true,
              routes: const [
                ProjectOverviewRoute(),
                ProjectSettingsRoute(),
                ProjectConfigurationEntriesRoute(),
                ProjectAccessRoute()
              ],
              builder: (context, child, animation) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: _ProjectViewWrapperTabBar(
                      onTap: context.tabsRouter.setActiveIndex,
                      currentIndex: context.tabsRouter.activeIndex,
                    ),
                  ),
                  const Divider(height: 1),
                  const SizedBox(height: 15),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: ChangeNotifierProvider<ProjectProvider>(
                        create: (context) => ProjectProvider(currentProject: project),
                        child: child,
                      ),
                    ),
                  )
                ],
              )
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class _ProjectViewWrapperTabBar extends StatefulWidget {

  final void Function(int index) onTap;
  final int currentIndex;

  const _ProjectViewWrapperTabBar({required this.onTap, required this.currentIndex, Key? key }) : super(key: key);

  @override
  __ProjectViewWrapperTabBarState createState() => __ProjectViewWrapperTabBarState();
}

class __ProjectViewWrapperTabBarState extends State<_ProjectViewWrapperTabBar> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this, initialIndex: widget.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: kSecondaryDarkColor,
      controller: _tabController,
      unselectedLabelColor: Colors.grey,
      indicatorPadding: EdgeInsets.zero,
      labelPadding: const EdgeInsets.symmetric(horizontal: 15),
      isScrollable: true,
      onTap: widget.onTap,
      tabs: const [
        Tab(
          text: "Project Overview",
          icon: Icon(Icons.dashboard),
        ),
        Tab(
          text: "Project Settings",
          icon: Icon(Icons.settings),
        ),
        Tab(
          text: "Configuration Entries",
          icon: Icon(Icons.edit),
        ),
        Tab(
          text: "Access",
          icon: Icon(Icons.security),
        )
      ],
    );
  }
}