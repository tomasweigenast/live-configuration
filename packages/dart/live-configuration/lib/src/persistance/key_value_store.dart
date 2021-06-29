import 'dart:convert';
import 'dart:io';

class KeyValueStore {
  static const String _fileName = 'live_config.dat';

  final Map<String, Object> _cache = {};

  late File _file;

  KeyValueStore() {
    _file = File(_fileName);
  }

  Future load() async {
    if(!await _file.exists()) {
      await _file.create(recursive: true);
    }

    try {
      var jsonEncoded = await _file.readAsString();
      dynamic pairs = (json.decode(jsonEncoded) as Map).cast<String, Object>();
      _cache.addAll(pairs);

    } catch(_) { }
  }

  Future save(String key, Object value) async {
    _cache[key] = value;
    await _saveToFile();
  }

  T? getValue<T>(String key) {
    return _cache[key] as T?;
  }

  Future _saveToFile() async {
    var jsonEncoded = json.encode(_cache);
    if(!await _file.exists()) {
      await _file.create(recursive: true);
    }

    await _file.writeAsString(jsonEncoded);
  }
}