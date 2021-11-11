class RegisterDetails {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String? phoneNumber;

  const RegisterDetails({required this.email, required this.password, required this.firstName, required this.lastName, this.phoneNumber});
}