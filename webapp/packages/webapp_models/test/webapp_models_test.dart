import 'package:flutter_test/flutter_test.dart';
import 'package:webapp_models/src/models/identity/organization/organization.dart';

import 'package:webapp_models/webapp_models.dart';

void main() {
  test('Test models', () {
    Organization((org) {
      org.name = "Hello";
    });
  });
}
