import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../app/models/user.dart';
import '../../../app/interfaces/auth/auth_interface.dart';

class AuthService extends IAuth {
  @override
  Future<User> login({String name, String email, String password}) async {
    final Uri api = Uri.parse('https://reqres.in/api/register');
    final body = {
      "email": email,
      "password": password,
    };
    http.Response response = await http.post(api, body: body);
    if (response.statusCode == 200) {
      final localStorage = await SharedPreferences.getInstance();
      final dataReceived = json.decode(response.body);
      await localStorage.setString('NAME', name);
      await localStorage.setString('TOKEN', dataReceived['token']);
      print('id: ${dataReceived['id']}, token: ${dataReceived['token']}');
      return User(
        name: name,
        email: email,
        password: password,
        id: dataReceived['id'],
        token: dataReceived['token'],
      );
    } else {
      return null;
    }
  }

  @override
  Future<String> getUser(String token) async {}

  @override
  Future logout(String token) async {}
}
