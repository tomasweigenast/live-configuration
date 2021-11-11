import 'package:webapp_api/src/models/protos/google/protobuf/timestamp.pb.dart';
import 'package:webapp_api/src/models/protos/google/protobuf/wrappers.pb.dart';
import 'package:webapp_api/src/models/protos/google/protobuf/duration.pb.dart' as pb0;

extension DateTimeExtensions on DateTime {
  Timestamp toTimestamp() {
    return Timestamp.fromDateTime(this);
  }
}

extension StringValueExtensions on StringValue {
  String? get valueOrNull => hasValue() ? value : null;
}

extension ProtoDurationExtensions on pb0.Duration {
  Duration toDuration() {
    return Duration(seconds: seconds.toInt() * Duration.microsecondsPerSecond + nanos ~/ 1000);
  }
}

extension StringExtensions on String {
  String toSentence() => this[0].toUpperCase() + substring(1, length);
}