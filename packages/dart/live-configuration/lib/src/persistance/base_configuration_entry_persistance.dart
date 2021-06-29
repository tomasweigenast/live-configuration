import 'package:live_configuration/src/models/configuration/config_entry.dart';

/// Provides methods to persist configuration entries
abstract class BaseConfigurationEntryPersistance {
  
  /// Saves all the entries
  Future saveAll(Iterable<ConfigEntry> entries);

  /// Retrieves all the entries.
  /// It will return null if no entry was read
  Future<Iterable<ConfigEntry>?> getAll();
}