// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_settings.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProjectSettings extends ProjectSettings {
  @override
  final bool enabled;

  factory _$ProjectSettings([void Function(ProjectSettingsBuilder)? updates]) =>
      (new ProjectSettingsBuilder()..update(updates)).build();

  _$ProjectSettings._({required this.enabled}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        enabled, 'ProjectSettings', 'enabled');
  }

  @override
  ProjectSettings rebuild(void Function(ProjectSettingsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProjectSettingsBuilder toBuilder() =>
      new ProjectSettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProjectSettings && enabled == other.enabled;
  }

  @override
  int get hashCode {
    return $jf($jc(0, enabled.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProjectSettings')
          ..add('enabled', enabled))
        .toString();
  }
}

class ProjectSettingsBuilder
    implements Builder<ProjectSettings, ProjectSettingsBuilder> {
  _$ProjectSettings? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  ProjectSettingsBuilder();

  ProjectSettingsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProjectSettings other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProjectSettings;
  }

  @override
  void update(void Function(ProjectSettingsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProjectSettings build() {
    final _$result = _$v ??
        new _$ProjectSettings._(
            enabled: BuiltValueNullFieldError.checkNotNull(
                enabled, 'ProjectSettings', 'enabled'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
