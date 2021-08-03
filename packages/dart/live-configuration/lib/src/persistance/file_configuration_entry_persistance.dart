import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:live_configuration/src/encoding/protobuf_encoding.dart';
import 'package:live_configuration/src/models/configuration/config_entry.dart';
import 'package:live_configuration/src/persistance/base_configuration_entry_persistance.dart';

/// Persists all the configuration entries to a file
class FileConfigurationEntryPersistance extends BaseConfigurationEntryPersistance {
  late final File file;

  FileConfigurationEntryPersistance(String path) {
    file = File(path);
  }

  @override
  Future<Iterable<ConfigEntry>?> getAll() async {
    // Read file
    if (!await file.exists()) {
      return null;
    }

    try {
      var buffer = await file.readAsBytes();

      // Decode using protobuf
      return ProtobufEncoding.decode(buffer, sanitize: false);
    } catch (err) {
      debugPrint('Error reading from file: $err');
      return null;
    }
  }

  @override
  Future saveAll(Iterable<ConfigEntry> entries) async {
    // Encoding using Protobuf
    var buffer = ProtobufEncoding.encode(entries);

    if (!await file.exists()) {
      await file.create(recursive: true);
    }

    await file.writeAsBytes(buffer);
  }
}
