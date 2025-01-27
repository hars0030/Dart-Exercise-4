import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main(List<String> arguments) async {
  try {
    var url = Uri.parse('https://random-data-api.com/api/v2/users?size=10');
    final res = await http.get(url);

    if (res.statusCode == 200) {
      var users = convert.jsonDecode(res.body) as List<dynamic>;
      final userList = users.map((e) => User.fromJson(e)).toList();

      for (final user in userList) {
        user.output();
      }
    } else {
      print('Request failed with status: ${res.statusCode}.');
    }
  } catch (e) {
    print('Error occurred: $e');
  }
}

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
