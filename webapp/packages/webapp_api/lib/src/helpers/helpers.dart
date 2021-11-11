class Tasks {
  Tasks._();

  static Future<Iterable<T>> execute<T>(Iterable<Future<T>?> futures) {
    return Future.wait(futures.where((element) => element != null).map((e) => e!));
  }
}