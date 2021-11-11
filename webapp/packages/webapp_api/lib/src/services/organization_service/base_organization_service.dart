import 'package:webapp_api/src/api/paginated_list.dart';
import 'package:webapp_api/src/models/identity/organization/organization.dart';
import 'package:webapp_api/src/services/base_service.dart';

abstract class BaseOrganizationService extends BaseService {
  /// Finds an organization by id.
  Future<Organization?> findOrganization(String organizationUid);
  
  /// Finds all the organizations added to an account.
  Future<PaginatedIterable<Organization>> findOrganizations({required String accountUid, String? nextPageToken});

  /// Creates an organization.
  Future createOrganization(String name, String accountUid);

  /// Deletes an organization.
  Future deleteOrganization(String organizationUid);

  /// Adds an organization member.
  Future addOrganizationMember(String organizationUid, String accountUid, OrganizationMemberPolicy policy);

  /// Removes an organization member.
  Future removeOrganizationMember(String organizationUid, String accountUid);

  /// Updates an organization member.
  Future updateOrganizationMember(String organizationUid, String accountUid, OrganizationMemberPolicy policy);
}