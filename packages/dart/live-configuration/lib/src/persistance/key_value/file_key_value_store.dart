import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as io_path;
import 'package:live_configuration/src/persistance/key_value/base_key_value_store.dart';
import 'package:path_provider/path_provider.dart';

class FileKeyValueStore extends BaseKeyValueStore {
  static const String _fileName = 'live_config.dat';

  final Map<String, Object> _cache = {};

  late final File _file;

  @override
  Future load() async {
    var dir = await getApplicationDocumentsDirectory();
    _file = File(io_path.join(dir.path, _fileName));

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

BaseKeyValueStore getKeyValueStore() => FileKeyValueStore();