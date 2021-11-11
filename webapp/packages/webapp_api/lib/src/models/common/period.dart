import 'package:built_value/built_value.dart';

part 'period.g.dart';

abstract class Period implements Built<Period, PeriodBuilder> {
  DateTime get startTime;
  DateTime get endTime; 

  Period._();

  factory Period([void Function(PeriodBuilder) updates]) = _$Period;
}