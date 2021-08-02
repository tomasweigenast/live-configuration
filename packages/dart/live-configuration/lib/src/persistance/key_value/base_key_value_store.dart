import 'key_value_store_stub.dart'
  if(dart.library.io) 'file_key_value_store.dart'
  if(dart.library.js)  'web_key_value_store.dart';

abstract class BaseKeyValueStore {
  static BaseKeyValueStore? _instance;

  static BaseKeyValueStore get instance {
    _instance ??= getKeyValueStore();
    return _instance!;
  }

  Future load();
  Future save(String key, Object value);
  T? getValue<T>(String key);
}