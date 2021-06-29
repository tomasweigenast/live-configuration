import 'dart:convert';

import 'package:live_configuration/src/deserializer/protobuf_configuration_deserializer.dart';
import 'package:test/test.dart';

void main() {
  const testEntries = 'YXBwbGljYXRpb24veC1wcm90b2J1ZhWYM0cKHAoNc2hpcHBpbmdQcmljZRACGgkhmpmZmZlZOUAKHAoNYmFzZU9yZGVyQ29zdBACGgkhAAAAAAAANEAKFwoPZmFjZWJvb2tFbmFibGVkEAMaAigBChMKCGNhY2hlVHRsEAcaBUoDCIQHChQKCGFwcFRpdGxlGggSBk15IEFwcApVCgdleGFtcGxlEAUaSDpGCgwKBFRleHQSBBICaGkKEAoKVGV4dExlbmd0aBICGAIKJAoGVmFsdWVzEhoyGAoFEgMxMjMKBhIENTU0NgoHEgVhMTI0ZA==';
  var entriesBuffer = base64.decode(testEntries);
  
  var deserializer = ProtobufConfigurationDeserializer();

  test('ProtobufConfigurationDeserializer.deserialize() deserializes configuration entries using Protobuf encoding', () {
    var entries = deserializer.deserialize(entriesBuffer);
  });
}