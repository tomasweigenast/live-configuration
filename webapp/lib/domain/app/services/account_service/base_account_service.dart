import 'package:webapp/domain/models/auth_state.dart';

abstract class BaseAccountService {

  AuthState _authState = AuthState.authenticated;

  bool get isLoggedIn => _authState == AuthState.authenticated;
}