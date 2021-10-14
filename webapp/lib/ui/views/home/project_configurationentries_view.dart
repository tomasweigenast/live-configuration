import 'package:flutter/material.dart';
import 'package:webapp/domain/models/configuration_entry.dart';
import 'package:webapp/ui/controls/paginated_table/paginated_table.dart';
import 'package:webapp/ui/controls/paginated_table/table_column.dart';

class ProjectConfigurationEntriesView extends StatefulWidget {
  const ProjectConfigurationEntriesView({ Key? key }) : super(key: key);

  @override
  _ProjectConfigurationEntriesViewState createState() => _ProjectConfigurationEntriesViewState();
}

class _ProjectConfigurationEntriesViewState extends State<ProjectConfigurationEntriesView> {
  @override
  Widget build(BuildContext context) {
    return PaginatedTable<ConfigurationEntry>(
      pageSizes: const [10, 20, 50],
      defaultPageSize: 10,
      resolvePage: (pageToken, pageSize) async {
        int initialIndex = pageToken != null ? int.parse(pageToken) : 2;

        await Future.delayed(const Duration(seconds: 1));
        return PageIndicator.items(
          items: List.generate(pageSize, (index) {
            index = index * initialIndex;
            return ConfigurationEntry(
              key: "entry_key_$index",
              description: "entry_${index}_description",
              name: "entry_${index}_name",
              valueType: "entry_${index}_value_type",
              value: "entry_${index}_value"
            );
          }),
          nextPageToken: initialIndex < 5 ? (++initialIndex).toString() : null
        );
      },
      columns: [
        TableColumn(
          flex: 2,
          title: "Key",
          rowFormatter: (context, item) => Text(item.key)
        ),
        TableColumn(
          title: "Name",
          flex: 2,
          rowFormatter: (context, item) => Text(item.name)
        ),
        TableColumn(
          title: "Value Type",
          flex: 2,
          rowFormatter: (context, item) => Text(item.valueType)
        ),
        TableColumn(
          title: "Value",
          flex: 6,
          rowFormatter: (context, item) => Text(item.value.toString())
        ),
        TableColumn(
          title: "Actions",
          rowFormatter: (context, item) => Row(
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                splashRadius: 20,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                splashRadius: 20,
                onPressed: () {},
              )
            ],
          )
        ),
      ],
    );
  }
}