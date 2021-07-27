import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as io_path;

abstract class BaseKeyValueStore {
  Future load();
  Future save(String key, Object value);
  T? getValue<T>(String key);
}

class KeyValueStore extends BaseKeyValueStore {
  static const String _fileName = 'live_config.dat';

  final Map<String, Object> _cache = {};

  late File _file;

  KeyValueStore(String? path) {
    if(path == null) {
      throw Exception('Path must be suplied when using this option.');
    }
    
    _file = File(io_path.join(path, _fileName));
  }

  @override
  Future load() async {
    if (!await _file.exists()) {
      await _file.create(recursive: true);
    }

    try {
      var jsonEncoded = await _file.readAsString();
      dynamic pairs = (json.decode(jsonEncoded) as Map).cast<String, Object>();
      _cache.addAll(pairs);
    } catch (_) {}
  }

  @override
  Future save(String key, Object value) async {
    _cache[key] = value;
    await _saveToFile();
  }

  @override
  T? getValue<T>(String key) {
    return _cache[key] as T?;
  }

  Future _saveToFile() async {
    var jsonEncoded = json.encode(_cache);
    if (!await _file.exists()) {
      await _file.create(recursive: true);
    }

    await _file.writeAsString(jsonEncoded);
  }
}
