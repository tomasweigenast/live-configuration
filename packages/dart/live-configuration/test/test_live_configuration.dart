import 'package:live_configuration/live_configuration.dart';
import 'package:live_configuration/src/models/configuration/config_entry.dart';
import 'package:live_configuration/src/type_decoder/json_type_decoder.dart';
import 'package:live_configuration/src/type_decoder/type_decoder_options.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  LiveConfigurationClient? client;

  group(
      'LiveConfigurationClient provides methods to connect to a LiveConfigurationNetwork and retrieve configuration settings',
      () {
    setUp(() {
      client = LiveConfigurationClient.mock(
        optionsSavePath: 'test',
        defaultEntries: [
          ConfigEntry.forBool('facebookLoginEnabled', false),
          ConfigEntry.forInt('maxLoginAttemps', 5),
          ConfigEntry.forString('appName', 'My App'),
          ConfigEntry.forDouble('shippingCost', 26.25),
          ConfigEntry.forList('numbers', [2, 6, 8, 125, 330, 999]),
          ConfigEntry.forList('cities', [
            {'name': 'Toronto', 'enabled': true},
            {'name': 'New York', 'enabled': false},
            {'name': 'Mexico', 'enabled': true}
          ]),
          ConfigEntry.forMap('mainCity', {'name': 'Toronto', 'enabled': true}),
          ConfigEntry.forMap('account', {'name': 'Tomás', 'age': 19}),
          ConfigEntry.forDateTime('expiration', DateTime(2060, 25, 15)),
          ConfigEntry.forDuration('timeToLive', Duration(days: 7)),
        ],
        typeDecoder: TypeDecoderOptions(
          decoder: JsonTypeDecoder(), 
          typeRegistry: {
            AppCity: () => AppCity(),
          }
        ),
      );
    });

    test(
        "LiveConfigurationClient.getString(key) returns the value of an entry as an string, throwing an exception if the configuration entry isn't of type string",
        () {
      var appName = client!.getString('appName');
      expect(appName, 'My App');

      expect(() => client!.getString('shippingCost'), throwsArgumentError);
    });

    test(
        "LiveConfigurationClient.getDouble(key) returns the value of an entry as a double, throwing an exception if the configuration entry isn't of type double",
        () {
      var shippingCost = client!.getDouble('shippingCost');
      expect(shippingCost, 26.25);

      expect(() => client!.getString('shippingCost'), throwsArgumentError);
    });

    test(
        "LiveConfigurationClient.getInt(key) returns the value of an entry as an int, throwing an exception if the configuration entry isn't of type int",
        () {
      var maxLoginAttemps = client!.getInt('maxLoginAttemps');
      expect(maxLoginAttemps, 5);

      expect(() => client!.getString('maxLoginAttemps'), throwsArgumentError);
    });

    test(
        "LiveConfigurationClient.getDateTime(key) returns the value of an entry as a DateTime, throwing an exception if the configuration entry isn't of type DateTime",
        () {
      var expiration = client!.getDateTime('expiration');
      expect(expiration, DateTime(2060, 25, 15));

      expect(() => client!.getString('expiration'), throwsArgumentError);
    });

    test(
        "LiveConfigurationClient.getDuration(key) returns the value of an entry as a Duration, throwing an exception if the configuration entry isn't of type Duration",
        () {
      var timeToLive = client!.getDuration('timeToLive');
      expect(timeToLive, Duration(days: 7));

      expect(() => client!.getString('timeToLive'), throwsArgumentError);
    });

    test(
        "LiveConfigurationClient.getList(key) returns the value of an entry as a List, throwing an exception if the configuration entry isn't of type List or the List generic type isn't the same of the configuration entry.",
        () {
      var numbers = client!.getList<int>('numbers');
      expect(numbers, [2, 6, 8, 125, 330, 999]);

      expect(() => client!.getString('numbers'), throwsArgumentError);
      expect(() => client!.getList<String>('numbers'),
          throwsA(isA<ArgumentError>()));
    });

    test(
        "LiveConfigurationClient.getMap(key) returns the value of an entry as a Map, throwing an exception if the configuration entry isn't of type Map or the Map generic type isn't the same of the configuration entry.",
        () {
      var mainCity = client!.getMap<String, dynamic>('mainCity');
      expect(mainCity, {'name': 'Toronto', 'enabled': true});

      expect(() => client!.getString('mainCity'), throwsArgumentError);
      expect(() => client!.getMap<String, double>('mainCity'),
          throwsA(isA<TypeError>()));
    });

    test(
        "LiveConfigurationClient.getAs<T>(key) returns the value of an entry as a the generic type, throwing an exception if the configuration entry isn't of type Map or it can't be converted to the generic type.",
        () {
      expect(() => client!.getAs<Person>('account'),
          throwsArgumentError); // Because Person was not registered as a type
    });

    test(
        "LiveConfigurationClient.getAs<T>(key) returns the value of an entry as a the generic type, throwing an exception if the configuration entry isn't of type Map or it can't be converted to the generic type.",
        () {
      var mainCity = client!.getAs<AppCity>('mainCity');
      expect(mainCity.city, 'Toronto');
      expect(mainCity.enabled, true);
    });

    test(
        "LiveConfigurationClient.getList<T>(key) returns the value of an entry as a the generic type, throwing an exception if the configuration entry isn't of type List or its values can't be converted to the generic type.",
        () {
      client!.getList<AppCity>('cities');
    });
  });
}

class AppCity extends ConfigType {
  late String _city;
  late bool _enabled;

  String get city => _city;
  bool get enabled => _enabled;

  AppCity.create(this._city, this._enabled);
  AppCity();

  @override
  void mergeFrom(Map<String, dynamic> map) {
    _city = map['name'];
    _enabled = map['enabled'];
  }
}

class Person extends ConfigType {
  late String _name;
  late int _age;

  String get name => _name;
  int get age => _age;

  Person.create(this._name, this._age);
  Person();

  @override
  void mergeFrom(Map<String, dynamic> map) {
    _name = map['name'];
    _age = map['age'];
  }
}
