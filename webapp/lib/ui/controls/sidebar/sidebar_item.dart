import 'package:flutter/widgets.dart';

class BaseSidebarItem {}

class SidebarItem extends BaseSidebarItem {
  final String text;
  final String? subtitle;
  final Widget icon;
  final void Function() onTap;

  SidebarItem({required this.text, required this.onTap, required this.icon, this.subtitle});
}