import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'configuration_entry.g.dart';

abstract class ConfigurationGroup implements Built<ConfigurationGroup, ConfigurationGroupBuilder> {
  String get uid;
  String get name;
  String? get description;
  DateTime get createdAt;
  DateTime get modifiedAt;
  int get entriesCount;
  int get currentVersion;

  ConfigurationGroup._();

  factory ConfigurationGroup([void Function(ConfigurationGroupBuilder) updates]) = _$ConfigurationGroup;
}

abstract class ConfigurationGroupVersion implements Built<ConfigurationGroupVersion, ConfigurationGroupVersionBuilder> {
  String get groupUid;
  int get version;
  DateTime get createdAt;
  DateTime? get publishAt;

  ConfigurationGroupVersion._();

  factory ConfigurationGroupVersion([void Function(ConfigurationGroupVersionBuilder) updates]) = _$ConfigurationGroupVersion;
}

abstract class ConfigurationEntry implements Built<ConfigurationEntry, ConfigurationEntryBuilder> {
  String get key;
  String get name;
  String? get description;
  DateTime get createdAt;
  DateTime get modifiedAt;  

  ConfigurationEntry._();

  factory ConfigurationEntry([void Function(ConfigurationEntryBuilder) updates]) = _$ConfigurationEntry;
}

abstract class ConfigurationEntryValue implements Built<ConfigurationEntryValue, ConfigurationEntryValueBuilder> {
  // Fields

  ConfigurationEntryValue._();

  factory ConfigurationEntryValue([void Function(ConfigurationEntryValueBuilder) updates]) = _$ConfigurationEntryValue;
}

class ConfigurationEntryValueType extends EnumClass {
  @BuiltValueEnumConst(wireNumber: 2)
  static const ConfigurationEntryValueType nil = _$nil;

  const ConfigurationEntryValueType._(String name) : super(name);

  static BuiltSet<ConfigurationEntryValueType> get values => _$values;
  static ConfigurationEntryValueType valueOf(String name) => _$valueOf(name);
}