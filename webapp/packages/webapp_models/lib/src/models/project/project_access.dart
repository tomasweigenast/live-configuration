import 'dart:typed_data';

import 'package:protobuf/protobuf.dart';
import 'package:webapp_models/src/models/protos/project.pb.dart' as pb;

class ProjectAccess {
  final pb.ProjectAccess _proto;

  ProjectAccess() : _proto = pb.ProjectAccess();
  ProjectAccess._fromProto(this._proto);

  factory ProjectAccess.fromJson(Map<String, Object?> json) {
    return ProjectAccess._fromProto(pb.ProjectAccess.create()..mergeFromProto3Json(json));
  }

  factory ProjectAccess.fromProto(Uint8List buffer) { 
    return ProjectAccess._fromProto(pb.ProjectAccess.fromBuffer(buffer));
  }

  ProjectAccess copyWith() {
    return ProjectAccess._fromProto(_proto.rebuild((proto) {
      
    }));
  }
  
  @override
  int get hashCode => _proto.hashCode;

  @override
  bool operator ==(Object other) => _proto == other;
}