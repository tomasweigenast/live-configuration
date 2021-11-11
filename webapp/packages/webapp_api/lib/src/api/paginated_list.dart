class PaginatedIterable<T extends Object> extends Iterable<T> {
  final Iterable<T> _inner;
  final String? _nextPageToken;

  String get nextPageToken => _nextPageToken!;
  bool get hasNextPageToken => _nextPageToken != null && _nextPageToken!.isNotEmpty;

  @override
  Iterator<T> get iterator => _inner.iterator;

  const PaginatedIterable(Iterable<T> other, [String? nextPageToken]) 
    : _inner = other,
      _nextPageToken = nextPageToken;

  /// Returns an empty paginated iterable.
  factory PaginatedIterable.empty() {
    return PaginatedIterable<T>(const []);
  }

  PaginatedIterable<TOther> mapTo<TOther extends Object>(TOther Function(T test) toElement) {
    return PaginatedIterable(_inner.map<TOther>(toElement));
  }

}