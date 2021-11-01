import 'package:built_value/built_value.dart';

part 'session.g.dart';

abstract class Session implements Built<Session, SessionBuilder> {
  String get uid;
  String get accountUid;
  DateTime get generatedAt;
  DateTime get modifiedAt;

  Session._();

  factory Session([void Function(SessionBuilder) updates]) = _$Session;
}