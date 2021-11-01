import 'dart:typed_data';

import 'package:protobuf/protobuf.dart';
import 'package:webapp_models/src/models/protos/project.pb.dart' as pb;

class ProjectSettings {
  final pb.ProjectSettings _proto;
  
  final bool enabled;

  ProjectSettings({required this.enabled}) : _proto = pb.ProjectSettings(enabled: enabled);
  ProjectSettings._fromProto(this._proto) : enabled = _proto.enabled;

  factory ProjectSettings.fromJson(Map<String, Object?> json) {
    return ProjectSettings._fromProto(pb.ProjectSettings.create()..mergeFromProto3Json(json));
  }

  factory ProjectSettings.fromProto(Uint8List buffer) { 
    return ProjectSettings._fromProto(pb.ProjectSettings.fromBuffer(buffer));
  }

  ProjectSettings copyWith({bool? enabled}) {
    return ProjectSettings._fromProto(_proto.rebuild((proto) {
      if(enabled != null) {
        proto.enabled = enabled;
      }
    }));
  }
  
  @override
  int get hashCode => _proto.hashCode;

  @override
  bool operator ==(Object other) => _proto == other;
}