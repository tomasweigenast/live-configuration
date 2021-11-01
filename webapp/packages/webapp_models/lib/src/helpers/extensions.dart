import 'package:webapp_models/src/models/protos/google/protobuf/timestamp.pb.dart';

extension DateTimeExtensions on DateTime {
  Timestamp toTimestamp() {
    return Timestamp.fromDateTime(this);
  }
}