import 'package:webapp_api/src/converter/type_converter.dart';
import 'package:webapp_api/src/helpers/extensions.dart';
import 'package:webapp_api/src/models/common/period.dart';
import 'package:webapp_api/src/models/protos/common.pb.dart' as pb0;

class PeriodConverter implements TypeConverter<Period, pb0.Period> {
  @override
  Period convertFrom(pb0.Period output, TypeConverterCollection converters) {
    return Period((b) => b 
      ..startTime = output.startTime.toDateTime()
      ..endTime = output.endTime.toDateTime()
    );
  }

  @override
  pb0.Period convertTo(Period input, TypeConverterCollection converters) {
    return pb0.Period(
      startTime: input.startTime.toTimestamp(),
      endTime: input.endTime.toTimestamp()
    );
  }

}