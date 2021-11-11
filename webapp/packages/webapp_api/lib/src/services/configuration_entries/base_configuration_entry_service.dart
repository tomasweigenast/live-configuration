import 'package:webapp_api/src/api/paginated_list.dart';
import 'package:webapp_api/src/models/configuration_entry/configuration_entry.dart';
import 'package:webapp_api/src/services/base_service.dart';

abstract class BaseConfigurationEntryService extends BaseService<ConfigurationEntry> {
  /// Finds all the configuration groups of the current organization.
  Future<PaginatedIterable<ConfigurationGroup>> findConfigurationGroups({String? nextPageToken});

  /// Finds all the versions of a configuration group
  Future<PaginatedIterable<ConfigurationGroupVersion>> findConfigurationGroupVersions(String configurationGroupUid, {String? nextPageToken});

  /// Finds a configuration group by uid
  Future<ConfigurationGroup> findConfigurationGroup(String configurationGroupUid);

  /// Finds a configuration group version by its version
  Future<ConfigurationGroupVersion?> findConfigurationGroupVersion(String configurationGroupUid, int version);

  /// Promotes a configuration group version.
  Future promoteConfigurationGroupVersion(String configurationGroupUid, int version);

  /// Creates a configuration group.
  Future<ConfigurationGroup> createConfigurationGroup(String name, String? description);

  /// Deletes a configuration group.
  Future deleteConfigurationGroup(String uid);

  /// Updates a configuration group.
  Future<ConfigurationEntry> updateConfigurationGroup(String configurationGroupUid, String? newDescription);

  /// Finds all the configuration entries of a group. If [version] is not specified, the latest version is picked.
  Future<PaginatedIterable<ConfigurationEntry>> findConfigurationGroupEntries(String configurationGroupUid, int? version, String? nextPageToken);

  /// Creates a configuration entry.
  Future<ConfigurationEntry> createConfigurationEntry(String configurationGroupUid, String key, String name, String? description, ConfigurationEntryValueType valueType, Object? value);

  /// Updates a configuration entry.
  Future<ConfigurationEntry> updateConfigurationEntry(String configurationGroupUid, String entryKey, String? newDescription, Object? newValue);

  /// Deletes a configuration entry.
  Future deleteConfigurationEntry(String configurationGroupUid, String entryKey);

  /// Finds a configuration entry. If [version] is not specified, the latest version is picked.
  Future<ConfigurationEntry?> findConfigurationEntry(String configurationGroupUid, int? version, String entryKey);
}