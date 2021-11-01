import 'dart:typed_data';

import 'package:protobuf/protobuf.dart';
import 'package:webapp_models/src/helpers/extensions.dart';
import 'package:webapp_models/src/models/protos/project.pb.dart' as pb;

class Project {
  final pb.Project _proto;
  final String uid;
  final String name;
  final String organizationUid;
  final DateTime createdAt;
  final DateTime? modifiedAt;

  Project._fromProto(this._proto) : 
    uid = _proto.uid,
    name = _proto.name,
    organizationUid = _proto.organizationUid,
    createdAt = _proto.createdAt.toDateTime(),
    modifiedAt = _proto.hasModifiedAt() ? _proto.modifiedAt.toDateTime() : null;

  Project({
    required this.uid, 
    required this.name, 
    required this.organizationUid, 
    required this.createdAt, 
    this.modifiedAt}) 
    : _proto = pb.Project(
        uid: uid,
        name: name,
        createdAt: createdAt.toTimestamp(),
        organizationUid: organizationUid,
        modifiedAt: modifiedAt?.toTimestamp()
      );

  factory Project.fromJson(Map<String, Object?> json) {
    return Project._fromProto(pb.Project.create()..mergeFromProto3Json(json));
  }

  factory Project.fromProto(Uint8List buffer) { 
    return Project._fromProto(pb.Project.fromBuffer(buffer));
  }

  Project copyWith({String? name, DateTime? modifiedAt}) {
    return Project._fromProto(_proto.rebuild((proto) {
      if(name != null) {
        proto.name = name;
      }

      if(modifiedAt != null) {
        proto.modifiedAt = modifiedAt.toTimestamp();
      }
    }));
  }
  
  @override
  int get hashCode => _proto.hashCode;

  @override
  bool operator ==(Object other) => _proto == other;
}