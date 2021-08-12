import 'dart:convert';
import 'dart:html';

import 'package:live_configuration/src/persistance/key_value/base_key_value_store.dart';

class WebKeyValueStore extends BaseKeyValueStore {

  static const String _kWebKeyValueStoreStorageName = 'live_config';
  final Map<String, Object> _cache = {};
  final Storage _storage = window.localStorage;

  @override
  T? getValue<T>(String key) {
    return _cache[key] as T?;
  }

  @override
  Future load() async {
    var value = _storage[_kWebKeyValueStoreStorageName];
    if(value != null) {
      var jsonMap = (json.decode(value) as Map).cast<String, Object>();
      _cache.addAll(jsonMap);
    }
  }

  @override
  Future save(String key, Object value) async {
    _cache[key] = value;
    await _save();
  }

  Future _save() async {
    var jsonEncoded = json.encode(_cache);
    _storage[_kWebKeyValueStoreStorageName] = jsonEncoded;
  }

}

BaseKeyValueStore getKeyValueStore() => WebKeyValueStore();