import 'package:webapp_api/src/converter/type_converter.dart';
import 'package:webapp_api/src/helpers/extensions.dart';
import 'package:webapp_api/src/models/protos/identity.pb.dart' as pb0;
import 'package:webapp_api/webapp_models.dart';

class SessionConverter implements TypeConverter<Session, pb0.Session> {
  @override
  Session convertFrom(pb0.Session output, TypeConverterCollection converters) {
    return Session((b) => b
      ..uid = output.uid
      ..accountUid = output.accountUid
      ..generatedAt = output.generatedAt.toDateTime()
      ..modifiedAt = output.hasModifiedAt() ? output.modifiedAt.toDateTime() : null
    );
  }

  @override
  pb0.Session convertTo(Session input, TypeConverterCollection converters) {
    return pb0.Session(
      uid: input.uid,
      accountUid: input.accountUid,
      generatedAt: input.generatedAt.toTimestamp(),
      modifiedAt: input.modifiedAt?.toTimestamp()
    );
  }
}