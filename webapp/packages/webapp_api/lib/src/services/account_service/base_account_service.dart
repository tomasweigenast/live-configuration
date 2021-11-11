import 'package:webapp_api/src/api/paginated_list.dart';
import 'package:webapp_api/src/models/api/auth_state.dart';
import 'package:webapp_api/src/models/api/register_details.dart';
import 'package:webapp_api/src/models/identity/account/account.dart';
import 'package:webapp_api/src/models/identity/organization/organization.dart';
import 'package:webapp_api/src/models/identity/session/session.dart';
import 'package:webapp_api/src/services/base_service.dart';

abstract class BaseAccountService extends BaseService {

  AuthenticationState get authState;
  Account get currentUser;
  Organization get organization;
  String get accountUid => currentUser.uid;

  /// Logs an user in.
  Future login(String username, String password);

  /// Registers an user.
  Future register(RegisterDetails details);

  /// Refreshes the current session
  Future refreshAccessToken();

  /// Logs an user out.
  Future logout();

  /// Gets any active session of the account.
  Future<PaginatedIterable<Session>> getActiveSessions(String accountUid);

  /// Removes an active session
  Future removeActiveSession(String sessionId);

  /// Changes account's password.
  Future changePassword(String accountUid, String currentPassword, String newPassword);

  /// Requests a code to reset a password. 
  Future getPasswordResetToken(String accountUid);

  /// Resets an account password with the give code.
  Future resetPassword(String accountUid, String code, String newPassword);

  /// Gets current signed in account data
  Future<Account> getAccountData();
}