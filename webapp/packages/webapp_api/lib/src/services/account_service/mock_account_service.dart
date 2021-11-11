import 'package:webapp_api/src/models/identity/organization/organization.dart';
import 'package:webapp_api/src/models/api/auth_state.dart';
import 'package:webapp_api/src/models/identity/session/session.dart';
import 'package:webapp_api/src/models/identity/account/account.dart';
import 'package:webapp_api/src/models/api/register_details.dart';
import 'package:webapp_api/src/api/paginated_list.dart';
import 'package:webapp_api/src/models/mock/mock_models.dart';
import 'package:webapp_api/src/services/account_service/base_account_service.dart';

class MockAccountService extends BaseAccountService {

  AuthenticationState _authState = AuthenticationState.undefined;
  Account? _currentUser;
  Organization? _currentOrganization;

  @override
  AuthenticationState get authState => _authState;

  @override
  Account get currentUser => _currentUser!;

  @override
  Organization get organization => _currentOrganization!;

  @override
  Future changePassword(String accountUid, String currentPassword, String newPassword) {
    return Future.value();
  }

  @override
  Future<Account> getAccountData() async {
    await Future.delayed(const Duration(seconds: 1));
    return MockModels.account();
  }

  @override
  Future<PaginatedIterable<Session>> getActiveSessions(String accountUid) {
    // TODO: implement getActiveSessions
    throw UnimplementedError();
  }

  @override
  Future getPasswordResetToken(String accountUid) {
    // TODO: implement getPasswordResetToken
    throw UnimplementedError();
  }

  @override
  Future login(String username, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future refreshAccessToken() {
    // TODO: implement refreshAccessToken
    throw UnimplementedError();
  }

  @override
  Future register(RegisterDetails details) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future removeActiveSession(String sessionId) {
    // TODO: implement removeActiveSession
    throw UnimplementedError();
  }

  @override
  Future resetPassword(String accountUid, String code, String newPassword) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

}