import 'package:liveconfiguration_webapp/domain/models/auth_state.dart';

abstract class BaseAccountService {

  AuthState _authState = AuthState.notAuthenticated;

  bool get isLoggedIn => _authState == AuthState.authenticated;
}