import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'configuration_entry.g.dart';

abstract class ConfigurationGroup implements Built<ConfigurationGroup, ConfigurationGroupBuilder> {
  String get uid;
  String get name;
  String? get description;
  DateTime get createdAt;
  DateTime? get modifiedAt;
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
  DateTime? get modifiedAt;
  ConfigurationEntryValue get value;  

  ConfigurationEntry._();

  factory ConfigurationEntry([void Function(ConfigurationEntryBuilder) updates]) = _$ConfigurationEntry;
}

abstract class ConfigurationEntryValue implements Built<ConfigurationEntryValue, ConfigurationEntryValueBuilder> {
  ConfigurationEntryValueType get valueType;
  Object? get value;

  ConfigurationEntryValue._();

  factory ConfigurationEntryValue([void Function(ConfigurationEntryValueBuilder) updates]) = _$ConfigurationEntryValue;
}

class ConfigurationEntryValueType extends EnumClass {
  @BuiltValueEnumConst(wireNumber: 0)
  static const ConfigurationEntryValueType nil = _$nil;

  @BuiltValueEnumConst(wireNumber: 1)
  static const ConfigurationEntryValueType bool = _$bool;

  @BuiltValueEnumConst(wireNumber: 2)
  static const ConfigurationEntryValueType string = _$string;

  @BuiltValueEnumConst(wireNumber: 3)
  static const ConfigurationEntryValueType int = _$int;

  @BuiltValueEnumConst(wireNumber: 4)
  static const ConfigurationEntryValueType double = _$double;

  @BuiltValueEnumConst(wireNumber: 5)
  static const ConfigurationEntryValueType timestamp = _$timestamp;

  @BuiltValueEnumConst(wireNumber: 6)
  static const ConfigurationEntryValueType duration = _$duration;

  @BuiltValueEnumConst(wireNumber: 7)
  static const ConfigurationEntryValueType list = _$list;

  @BuiltValueEnumConst(wireNumber: 8)
  static const ConfigurationEntryValueType map = _$map;

  @BuiltValueEnumConst(wireNumber: 9)
  static const ConfigurationEntryValueType rawJson = _$rawJson;

  @BuiltValueEnumConst(wireNumber: 10)
  static const ConfigurationEntryValueType blob = _$blob;

  const ConfigurationEntryValueType._(String name) : super(name);

  static BuiltSet<ConfigurationEntryValueType> get values => _$values;
  static ConfigurationEntryValueType valueOf(String name) => _$valueOf(name);
}