import 'dart:typed_data';

import 'package:protobuf/protobuf.dart';
import 'package:webapp_models/src/models/protos/project.pb.dart' as pb;

class ProjectUsage {
  final pb.ProjectUsage _proto;

  ProjectUsage() : _proto = pb.ProjectUsage();
  ProjectUsage._fromProto(this._proto);

  factory ProjectUsage.fromJson(Map<String, Object?> json) {
    return ProjectUsage._fromProto(pb.ProjectUsage.create()..mergeFromProto3Json(json));
  }

  factory ProjectUsage.fromProto(Uint8List buffer) { 
    return ProjectUsage._fromProto(pb.ProjectUsage.fromBuffer(buffer));
  }

  ProjectUsage copyWith() {
    return ProjectUsage._fromProto(_proto.rebuild((proto) {
      
    }));
  }
  
  @override
  int get hashCode => _proto.hashCode;

  @override
  bool operator ==(Object other) => _proto == other;
}