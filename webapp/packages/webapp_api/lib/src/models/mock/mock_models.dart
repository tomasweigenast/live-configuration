import 'package:webapp_api/src/helpers/extensions.dart';
import 'package:webapp_api/src/models/identity/account/account.dart';
import 'package:faker/faker.dart';
import 'package:webapp_api/src/models/identity/organization/organization.dart';
import 'package:webapp_api/webapp_models.dart';

class MockModels {
  MockModels._();

  static final Faker _faker = Faker();
  static late final List<Organization> _organizations;
  static late final List<Project> _projects;
  static late final List<Session> _sessions;
  static late final Account _account;

  static void setupMock() {
    _account = Account((b) => b
      ..firstName = _faker.person.firstName()
      ..lastName = _faker.person.lastName()
      ..email = _faker.internet.safeEmail()
      ..phoneNumber = _faker.phoneNumber.us()
      ..registrationAt = _faker.date.dateTime(minYear: 2019, maxYear: 2021)
      ..modifiedAt = b.registrationAt!.add(const Duration(days: 20))
    );

    _organizations = List.generate(5, (index) => Organization((b) => b
      ..uid = _faker.guid.guid()
      ..name = _faker.company.name()
      ..accountUid = _account.uid
      ..createdAt = _faker.date.dateTime(minYear: 2020, maxYear: 2022)
    ));

    _projects = List.generate(50, (index) => Project((b) => b
      ..uid = _faker.guid.guid()
      ..name = _faker.lorem.word().toSentence()
      ..isFavorited = _faker.randomGenerator.boolean()
      ..createdAt = _faker.date.dateTime(minYear: 2020, maxYear: 2022)
      ..organizationUid = _randomFromList(_organizations).uid
    ));

    _sessions = List.generate(100, (index) => Session((b) => b
      ..accountUid = _account.uid
      ..uid = _faker.guid.guid()
      ..generatedAt = _faker.date.dateTime(minYear: 2020, maxYear: 2022)
      ..modifiedAt = _faker.randomGenerator.boolean() ? _faker.date.dateTime(minYear: 2020, maxYear: 2022) : null
    ));
  }

  static Account account() => _account;
  static Iterable<Project> projects() => _projects;
  static Iterable<Organization> organizations() => _organizations;
  static Iterable<Session> sessions() => _sessions;
  
  static T _randomFromList<T>(List<T> iterable) {
    return iterable[_faker.randomGenerator.integer(iterable.length)];
  }
}