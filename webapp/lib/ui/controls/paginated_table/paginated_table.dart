import 'package:flutter/material.dart';
import 'package:webapp/helpers/constants.dart';
import 'package:webapp/ui/controls/paginated_table/table_column.dart';

class PaginatedTable<T extends Object> extends StatefulWidget {

  final List<TableColumn<T>> columns;
  final List<int>? pageSizes;
  final int? defaultPageSize;
  final String initialPageToken;
  final Future<PageIndicator<T>> Function(String? pageToken, int pageSize) resolvePage;

  const PaginatedTable({required this.columns, required this.resolvePage, String? initialPageToken, this.pageSizes, this.defaultPageSize, Key? key }) 
    : initialPageToken = initialPageToken ?? "", super(key: key);

  @override
  _PaginatedTableState<T> createState() => _PaginatedTableState<T>();
}

class _PaginatedTableState<T extends Object> extends State<PaginatedTable<T>> {

  final Map<String, _Page<T>> _pageCache = {};

  late int _pageSize;
  late List<int> _pageSizes;
  late _Page<T> _currentPage;
  bool _isLoading = false;
  int _lastIndex = 1;
  Object? _error;

  @override
  void initState() {
    super.initState();

    assert(() {
      if(widget.pageSizes != null && widget.defaultPageSize != null) {
        return widget.pageSizes!.contains(widget.defaultPageSize!);
      }

      return true;
    }(), "defaultPageSize must be included in pageSizes.");

    _pageSizes = widget.pageSizes ?? [20, 50, 70];
    _pageSize = widget.defaultPageSize ?? 20;
    _currentPage = _Page.initial(currentPageToken: widget.initialPageToken);

    _getPage(pageType: _PageType.current);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 42,
            color: Colors.grey[200],
            child: DefaultTextStyle(
              style: const TextStyle(fontWeight: FontWeight.w500),
              child: Row(  
                children: _buildColumns()
              ),
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: _buildResultSet(context),
          ),
          const Divider(height: 1),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 42,
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.refresh),
                  splashRadius: 20,
                  tooltip: "Refresh",
                  color: kSecondaryDarkColor,
                  onPressed: () {
                    _refresh(clearCache: false);
                  },
                ),
                const SizedBox(width: 12),
                const VerticalDivider(width: 1),
                const SizedBox(width: 12),

                const SelectableText("Rows per page"),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  width: 80,
                  child: DropdownButtonFormField<int>(
                    isExpanded: false,
                    value: _pageSize,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.zero),
                      contentPadding: EdgeInsets.only(left: 10),
                    ),
                    style: const TextStyle(fontSize: 14),
                    items: _pageSizes.map((e) => DropdownMenuItem(child: Text(e.toString()), value: e)).toList(),
                    onChanged: _isLoading ? null : (newPageSize) {
                      if(newPageSize != null) {
                        _pageSize = newPageSize;
                        _refresh(clearCache: true);
                      }
                    },
                  ),
                ),

                const SizedBox(width: 12),
                const VerticalDivider(width: 1),
                const SizedBox(width: 20),

                SelectableText("Page ${_currentPage.index}"),

                const SizedBox(width: 20),
                const VerticalDivider(width: 1),
                const SizedBox(width: 12),
                IconButton(
                  icon: const Icon(Icons.navigate_before),
                  splashRadius: 20,
                  tooltip: "Previous page",
                  color: kSecondaryDarkColor,
                  onPressed: _currentPage.hasPreviousPage ? () {
                    _getPage(pageType: _PageType.previous);
                  } : null,
                ),
                IconButton(
                  icon: const Icon(Icons.navigate_next),
                  splashRadius: 20,
                  tooltip: "Next page",
                  color: kSecondaryDarkColor,
                  onPressed: _currentPage.hasNextPage ? () {
                    _getPage(pageType: _PageType.next);
                  } : null,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildColumns() {
    List<Widget> items = [];
    for(var column in widget.columns) {
      items.addAll([
        Expanded(
          flex: column.flex,
          child: SelectableText(column.title),
        ),
        const SizedBox(width: 20)
      ]);
    }

    return items;
  }

  Widget _buildResultSet(BuildContext context) {
    if(_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if(_error != null) {
      return Center(child: Text("An error has ocurred.\n$_error"));
    }

    return ListView.builder(
      itemCount: _currentPage.currentItems.length,
      itemBuilder: (context, index) {
        var item = _currentPage.currentItems[index];
        return Material(
          color: Colors.white,
          child: InkWell(
            onTap: () {},
            child: Row(
              children: _buildRow(context, item)
            )
          ),
        );
      },
    );
  }

  List<Widget> _buildRow(BuildContext context, T item) {
    var items = <Widget>[
      const SizedBox(width: 12)
    ];
    for(var column in widget.columns) {
      items.addAll([
        Expanded(
          flex: column.flex,
          child: column.rowFormatter(context, item),
        ),
        const SizedBox(width: 20)
      ]);
    }

    items.add(const SizedBox(width: 12));

    return items;
  }

  Future _getPage({required _PageType pageType}) async {
    setState(() {
      _isLoading = true;
    });

    String? fetchToken;
    int newPageIndex;
    switch(pageType) {
      case _PageType.previous:
        fetchToken = _currentPage.previousPageToken;
        newPageIndex = _lastIndex--;
        break;

      case _PageType.current:
        fetchToken = _currentPage.currentPageToken;
        newPageIndex = _lastIndex;
        break;

      case _PageType.next:
        fetchToken = _currentPage.nextPageToken;
        newPageIndex = _lastIndex++;
        break;
    }

    String? previousPageToken = _currentPage.isInitial ? null : _currentPage.currentPageToken;
    _Page<T>? newPage;

    try {

      // Try to get from cache first
      newPage = _pageCache[_currentPage.nextPageToken];

      // If not found, resolve new page
      if(newPage == null) {
        PageIndicator<T> result = await widget.resolvePage(fetchToken, _pageSize);

        if(result.error != null) {
          throw result.error!;
        }

        // Create new page
        newPage = _Page<T>(
          currentPageToken: fetchToken, 
          nextPageToken: result.nextPageToken, 
          previousPageToken: previousPageToken, 
          currentItems: result.items, 
          index: newPageIndex
        );

        debugPrint(newPage.debugPrint());
      }
    } catch(err) {
      if(mounted) {
        setState(() {
          _error = err;
          _isLoading = false;
        });
      }

      return;
    }

    if(mounted) {
      setState(() {
        _currentPage = newPage!;
        _isLoading = false;
        _error = null;
      });
    } 
  }

  void _refresh({required bool clearCache}) {
    _PageType pageType = _PageType.current;
    
    if(clearCache) {
      _pageCache.clear();
      _currentPage = _Page.initial(currentPageToken: widget.initialPageToken);
      pageType = _PageType.next;
    }

    _getPage(pageType: pageType);
  }
}

enum _PageType {
  previous, current, next
}


class PageIndicator<T> {
  final List<T> items;
  final String? nextPageToken;
  final Object? error;

  PageIndicator._(this.items, this.nextPageToken, this.error);

  factory PageIndicator.items({required List<T> items, String? nextPageToken}) {
    return PageIndicator._(items, nextPageToken, null);
  }

  factory PageIndicator.error({required Object? error}) {
    return PageIndicator._(const [], null, error);
  }
}