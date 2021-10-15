class PaginatedTableState<T> {
  final Map<String, _Page<T>> _pageCache;
  
}

class _Page<T> {
  final String? currentPageToken, nextPageToken, previousPageToken;
  final List<T> currentItems;
  final int index;

  bool get hasNextPage => nextPageToken != null;
  bool get hasPreviousPage => previousPageToken != null;
  bool get isInitial => index == 0;

  _Page({required this.currentPageToken, required this.nextPageToken, required this.previousPageToken, required this.currentItems, required this.index});

  factory _Page.initial({required String currentPageToken}) {
    return _Page(currentPageToken: currentPageToken, previousPageToken: null, nextPageToken: null, currentItems: const [], index: 0);
  }

  String debugPrint() {
    return {
      "currentPageToken": currentPageToken,
      "nextPageToken": nextPageToken,
      "previosPageToken": previousPageToken,
      "index": index
    }.toString();
  }
}