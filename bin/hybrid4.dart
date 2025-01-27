import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:hybrid4/hybrid4.dart';

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
