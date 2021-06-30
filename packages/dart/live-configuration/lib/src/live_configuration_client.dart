import 'dart:async';
import 'dart:typed_data';

import 'package:live_configuration/src/deserializer/base_configuration_deserializer.dart';
import 'package:live_configuration/src/deserializer/json_configuration_deserializer.dart';
import 'package:live_configuration/src/deserializer/protobuf_configuration_deserializer.dart';
import 'package:live_configuration/src/models/configuration/config_entry.dart';
import 'package:live_configuration/src/models/live_configuration_options.dart';
import 'package:live_configuration/src/models/protos/live_configuration.pb.dart';
import 'package:live_configuration/src/persistance/base_configuration_entry_persistance.dart';
import 'package:live_configuration/src/persistance/file_configuration_entry_persistance.dart';
import 'package:live_configuration/src/persistance/key_value_store.dart';

import 'package:http/http.dart' as http;
import 'package:live_configuration/src/type_decoder/type_decoder_options.dart';

class LiveConfigurationClient {
  final LiveConfigurationOptions _options;
  final BaseConfigurationEntryPersistance _persistance;
  final BaseConfigurationDeserializer _deserializer;
  final TypeDecoderOptions? _typeDecoder;
  final Map<String, ConfigEntry> _entries;
  final KeyValueStore _store;
  final Map<Type, dynamic> _cacheTypes = {};

  DateTime? _lastFetchDate;

  LiveConfigurationClient(
      {required LiveConfigurationOptions options,
      required BaseConfigurationEntryPersistance persistance,
      required BaseConfigurationDeserializer deserializer,
      TypeDecoderOptions? typeDecoder})
      : _options = options,
        _persistance = persistance,
        _deserializer = deserializer,
        _typeDecoder = typeDecoder,
        _entries = {},
        _store = KeyValueStore();

  LiveConfigurationClient.dev(
      {Iterable<ConfigEntry>? defaultEntries,
      LiveConfigurationOptions? options,
      BaseConfigurationEntryPersistance? persistance,
      BaseConfigurationDeserializer? deserializer,
      TypeDecoderOptions? typeDecoder})
      : _options = options ?? LiveConfigurationOptions(connectionEndpoint: ''),
        _persistance = persistance ??
            FileConfigurationEntryPersistance('configuration-entries.json'),
        _deserializer = deserializer ?? JsonConfigurationDeserializer(),
        _typeDecoder = typeDecoder,
        _store = KeyValueStore(),
        _entries = defaultEntries != null
            ? {for (var e in defaultEntries) e.key: e}
            : {};

  /// Initializes the live configuration client
  Future init() async {
    // Load store
    await _store.load();

    // Get last fetch date
    _lastFetchDate = _getLastFetchDate();

    unawaited(_fetch());
  }

  String getString(String key) {
    return _getEntry(
        key, ConfigurationEntryValueType.ConfigurationEntryValueType_STRING);
  }

  bool getBool(String key) {
    return _getEntry(
        key, ConfigurationEntryValueType.ConfigurationEntryValueType_BOOL);
  }

  int getInt(String key) {
    return _getEntry(
        key, ConfigurationEntryValueType.ConfigurationEntryValueType_INT);
  }

  double getDouble(String key) {
    return _getEntry(
        key, ConfigurationEntryValueType.ConfigurationEntryValueType_DOUBLE);
  }

  Duration getDuration(String key) {
    return _getEntry(
        key, ConfigurationEntryValueType.ConfigurationEntryValueType_DURATION);
  }

  DateTime getDateTime(String key) {
    return _getEntry(
        key, ConfigurationEntryValueType.ConfigurationEntryValueType_TIMESTAMP);
  }

  List<T> getList<T>(String key) {
    var list = _getEntry(
        key, ConfigurationEntryValueType.ConfigurationEntryValueType_LIST);
    try {
      return (list as List).cast<T>().toList();
    } catch (_) {
      List<T>? result = <T>[];
      result = _cacheTypes[result.runtimeType];
      if (result == null) {
        try {
          result = (list as List)
              .cast<Map>()
              .map((e) => _decode<T>(e.cast<String, dynamic>()))
              .toList();
        } catch (_) {
          throw ArgumentError("Can't decode entries of type $T");
        }

        _cacheTypes[result.runtimeType] = result;
      }

      return result;
    }
  }

  Map<TKey, TValue> getMap<TKey, TValue>(String key) {
    var map = _getEntry(
        key, ConfigurationEntryValueType.ConfigurationEntryValueType_JSON);
    return (map as Map).cast<TKey, TValue>();
  }

  T getAs<T>(String key) {
    if (_typeDecoder == null) {
      throw ArgumentError(
          'Could not convert to type if type decoder is not specified.');
    }

    T? instance = _cacheTypes[T];
    if (instance == null) {
      var map = getMap<String, dynamic>(key);
      instance = _decode<T>(map);

      _cacheTypes[T] = instance;
    }

    return instance!;
  }

  T _decode<T>(Map<String, dynamic> map) {
    var decoder = _typeDecoder!.decoder;
    var typeInstance = _typeDecoder!.typeRegistry[T];

    if (typeInstance == null) {
      throw ArgumentError('Could not found any type factory for type $T');
    }

    return decoder.decode<T>(typeInstance(), map);
  }

  dynamic _getEntry(String key, ConfigurationEntryValueType verifyType) {
    var entry = _entries[key];
    if (entry == null) {
      return null;
    }

    if (entry.valueType != verifyType) {
      throw ArgumentError(
          'Could not convert entry of type ${entry.valueType} to $verifyType.');
    }

    return entry.value;
  }

  /// Fetches entries from remote server if current ones are out dated
  Future _fetch() async {
    // Ignore because values are up to date
    if (_entries.isNotEmpty ||
        (_lastFetchDate != null &&
            _lastFetchDate!.add(_options.cacheTtl).isAfter(DateTime.now()))) {
      return;
    }

    // Make request
    try {
      var response = await http
          .get(Uri.parse(_options.connectionEndpoint))
          .timeout(const Duration(seconds: 10));

      // Parse response
      var buffer = _options.responseInterpreter != null
          ? _options.responseInterpreter!(response)
          : LiveConfigurationOptions.defaultResponseInterpreter(response);

      // Deserialize buffer
      var entries = _deserializer.deserialize(buffer);

      // Populate to cache
      _entries.addAll({for (var e in entries) e.key: e});

      // Save to file
      await _persistance.saveAll(entries);

      await _setLastFetchDate();
    } catch (ex) {
      if (ex is TimeoutException) {
        print(
            '[LIVE-CONFIGURATION] Could not fetch entries from remote server. Timeout exception.');
      } else {
        print(
            '[LIVE-CONFIGURATION] Could not fetch entries from remote server: $ex');
      }
    }
  }

  DateTime? _getLastFetchDate() {
    var lastFetchTimestamp = _store.getValue<int>('last_fetch');
    if (lastFetchTimestamp != null) {
      try {
        _lastFetchDate =
            DateTime.fromMillisecondsSinceEpoch(lastFetchTimestamp);
        return _lastFetchDate;
      } catch (_) {}
    }
  }

  Future _setLastFetchDate() async {
    _lastFetchDate = DateTime.now();
    var lastFetchTimestamp = _lastFetchDate!.millisecondsSinceEpoch;
    await _store.save('last_fetch', lastFetchTimestamp);
  }
}

void unawaited(Future<void>? future) {}
