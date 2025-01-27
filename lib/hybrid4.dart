class User {
  final int id;
  final String firstName;
  final String lastName;

  User({required this.id, required this.firstName, required this.lastName});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json["id"] ?? -1,
        firstName: json["first_name"] ?? 'Unknown',
        lastName: json["last_name"] ?? 'Unknown');
  }

  void output() {
    print('ID: $id, First Name: $firstName, Last Name: $lastName');
  }
}
