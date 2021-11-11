import 'package:webapp_api/src/api/api_response.dart';
import 'package:webapp_api/src/converter/type_converter.dart';
import 'package:webapp_api/src/models/protos/api.pb.dart' as pb0;

class PageDetailsConverter implements TypeConverter<PageDetails, pb0.PageDetails> {
  @override
  PageDetails convertFrom(pb0.PageDetails output, TypeConverterCollection converters) {
    return PageDetails(
      pageSize: output.pageSize,
      pageToken: output.pageToken
    );
  }

  @override
  pb0.PageDetails convertTo(PageDetails input, TypeConverterCollection converters) {
    return pb0.PageDetails(
      pageToken: input.pageToken,
      pageSize: input.pageSize
    );
  }
}