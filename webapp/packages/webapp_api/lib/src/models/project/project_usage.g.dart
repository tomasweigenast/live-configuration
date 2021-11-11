// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_usage.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProjectUsage extends ProjectUsage {
  @override
  final Period period;
  @override
  final int totalRequests;
  @override
  final int requestsPerSecond;
  @override
  final ProductUsageOperations? operations;

  factory _$ProjectUsage([void Function(ProjectUsageBuilder)? updates]) =>
      (new ProjectUsageBuilder()..update(updates)).build();

  _$ProjectUsage._(
      {required this.period,
      required this.totalRequests,
      required this.requestsPerSecond,
      this.operations})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(period, 'ProjectUsage', 'period');
    BuiltValueNullFieldError.checkNotNull(
        totalRequests, 'ProjectUsage', 'totalRequests');
    BuiltValueNullFieldError.checkNotNull(
        requestsPerSecond, 'ProjectUsage', 'requestsPerSecond');
  }

  @override
  ProjectUsage rebuild(void Function(ProjectUsageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProjectUsageBuilder toBuilder() => new ProjectUsageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProjectUsage &&
        period == other.period &&
        totalRequests == other.totalRequests &&
        requestsPerSecond == other.requestsPerSecond &&
        operations == other.operations;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, period.hashCode), totalRequests.hashCode),
            requestsPerSecond.hashCode),
        operations.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProjectUsage')
          ..add('period', period)
          ..add('totalRequests', totalRequests)
          ..add('requestsPerSecond', requestsPerSecond)
          ..add('operations', operations))
        .toString();
  }
}

class ProjectUsageBuilder
    implements Builder<ProjectUsage, ProjectUsageBuilder> {
  _$ProjectUsage? _$v;

  PeriodBuilder? _period;
  PeriodBuilder get period => _$this._period ??= new PeriodBuilder();
  set period(PeriodBuilder? period) => _$this._period = period;

  int? _totalRequests;
  int? get totalRequests => _$this._totalRequests;
  set totalRequests(int? totalRequests) =>
      _$this._totalRequests = totalRequests;

  int? _requestsPerSecond;
  int? get requestsPerSecond => _$this._requestsPerSecond;
  set requestsPerSecond(int? requestsPerSecond) =>
      _$this._requestsPerSecond = requestsPerSecond;

  ProductUsageOperations? _operations;
  ProductUsageOperations? get operations => _$this._operations;
  set operations(ProductUsageOperations? operations) =>
      _$this._operations = operations;

  ProjectUsageBuilder();

  ProjectUsageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _period = $v.period.toBuilder();
      _totalRequests = $v.totalRequests;
      _requestsPerSecond = $v.requestsPerSecond;
      _operations = $v.operations;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProjectUsage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProjectUsage;
  }

  @override
  void update(void Function(ProjectUsageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProjectUsage build() {
    _$ProjectUsage _$result;
    try {
      _$result = _$v ??
          new _$ProjectUsage._(
              period: period.build(),
              totalRequests: BuiltValueNullFieldError.checkNotNull(
                  totalRequests, 'ProjectUsage', 'totalRequests'),
              requestsPerSecond: BuiltValueNullFieldError.checkNotNull(
                  requestsPerSecond, 'ProjectUsage', 'requestsPerSecond'),
              operations: operations);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'period';
        period.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ProjectUsage', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
