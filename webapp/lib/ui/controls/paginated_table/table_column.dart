import 'package:flutter/cupertino.dart';

class TableColumn<T> {
  final String title;
  final int flex;
  final Widget Function(BuildContext context, T item) rowFormatter;

  const TableColumn({required this.title, required this.rowFormatter, this.flex = 1});
}