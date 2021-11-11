class Lazy<T> {
  final T Function() builder;

  T? _value;

  Lazy(this.builder);

  T call() {
    return _value ??= builder();
  } 
}