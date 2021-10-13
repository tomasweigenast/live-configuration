import 'package:flutter/foundation.dart';
import 'package:webapp/domain/app/services/account_service/base_account_service.dart';
import 'package:webapp/domain/app/services/account_service/mock_account_service.dart';
import 'package:webapp/domain/app/services/account_service/prod_account_service.dart';

/// Main entry for LiveConfiguration app
class Application {
  // Prevent instantiation.
  Application._();

  static final _AppServices _services = _AppServices();

  /// Maintains a list of all app's services and their lifetimes.
  static _AppServices get services => _services;

}

class _AppServices {
  late final BaseAccountService _accountService;

  _AppServices() {
    _accountService = kDebugMode ? MockAccountService() : AccountService();
  }

  BaseAccountService get accountService => _accountService;
}