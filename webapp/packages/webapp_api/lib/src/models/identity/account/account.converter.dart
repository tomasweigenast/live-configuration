import 'package:webapp_api/src/converter/type_converter.dart';
import 'package:webapp_api/src/helpers/extensions.dart';
import 'package:webapp_api/src/models/identity/account/account.dart';
import 'package:webapp_api/src/models/protos/identity.pb.dart' as pb0;

class AccountConverter implements TypeConverter<Account, pb0.Account> {
  @override
  Account convertFrom(pb0.Account output, TypeConverterCollection converters) {
    return Account((b) => b
      ..uid = output.uid
      ..firstName = output.firstName
      ..lastName = output.lastName
      ..email = output.email
      ..phoneNumber = output.hasPhoneNumber() ? output.phoneNumber : null
      ..registrationAt = output.registrationDate.toDateTime()
      ..modifiedAt = output.hasLastModified() ? output.lastModified.toDateTime() : null
    );
  }

  @override
  pb0.Account convertTo(Account input, TypeConverterCollection converters) {
    return pb0.Account(
      uid: input.uid,
      firstName: input.firstName,
      lastName: input.lastName,
      email: input.email,
      phoneNumber: input.phoneNumber,
      registrationDate: input.registrationAt.toTimestamp(),
      lastModified: input.modifiedAt?.toTimestamp()
    );
  }
}