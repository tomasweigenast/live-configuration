// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Period extends Period {
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;

  factory _$Period([void Function(PeriodBuilder)? updates]) =>
      (new PeriodBuilder()..update(updates)).build();

  _$Period._({required this.startTime, required this.endTime}) : super._() {
    BuiltValueNullFieldError.checkNotNull(startTime, 'Period', 'startTime');
    BuiltValueNullFieldError.checkNotNull(endTime, 'Period', 'endTime');
  }

  @override
  Period rebuild(void Function(PeriodBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PeriodBuilder toBuilder() => new PeriodBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Period &&
        startTime == other.startTime &&
        endTime == other.endTime;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, startTime.hashCode), endTime.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Period')
          ..add('startTime', startTime)
          ..add('endTime', endTime))
        .toString();
  }
}

class PeriodBuilder implements Builder<Period, PeriodBuilder> {
  _$Period? _$v;

  DateTime? _startTime;
  DateTime? get startTime => _$this._startTime;
  set startTime(DateTime? startTime) => _$this._startTime = startTime;

  DateTime? _endTime;
  DateTime? get endTime => _$this._endTime;
  set endTime(DateTime? endTime) => _$this._endTime = endTime;

  PeriodBuilder();

  PeriodBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Period other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Period;
  }

  @override
  void update(void Function(PeriodBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Period build() {
    final _$result = _$v ??
        new _$Period._(
            startTime: BuiltValueNullFieldError.checkNotNull(
                startTime, 'Period', 'startTime'),
            endTime: BuiltValueNullFieldError.checkNotNull(
                endTime, 'Period', 'endTime'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
