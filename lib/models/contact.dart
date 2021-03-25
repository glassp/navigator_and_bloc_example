/// Just a data class
class Contact {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;

  Contact(this.firstName, this.lastName, this.phoneNumber, this.email);

  String get fullName => "$lastName, $firstName";
}