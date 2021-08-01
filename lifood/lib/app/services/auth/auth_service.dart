import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../app/models/user.dart';
import '../../../app/interfaces/auth/auth_interface.dart';

class AuthService extends IAuth {
  @override
  Future<User> register({String name, String email, String password}) async {
    final Uri api = Uri.parse('https://reqres.in/api/register');
    final body = {
      "email": email,
      "password": password,
    };
    http.Response response = await http.post(api, body: body);
    if (response.statusCode == 200) {
      final _localStorage = await SharedPreferences.getInstance();
      final dataReceived = json.decode(response.body);
      final nameExist = _localStorage.getString('NAME');
      if (nameExist != null) {
        await _localStorage.remove('NAME');
      }
      await _localStorage.setString('NAME', name);
      await _localStorage.setString('TOKEN', dataReceived['token']);
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
  Future<User> login({String email, String password}) async {
    final Uri api = Uri.parse('https://reqres.in/api/register');
    final body = {
      "email": email,
      "password": password,
    };
    http.Response response = await http.post(api, body: body);
    if (response.statusCode == 200) {
      final _localStorage = await SharedPreferences.getInstance();
      final dataReceived = json.decode(response.body);
      await _localStorage.setString('TOKEN', dataReceived['token']);
      print('id: ${dataReceived['id']}, token: ${dataReceived['token']}');
      return User(
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
  Future<Map> getUser(String token, String name) async {
    final _localStorage = await SharedPreferences.getInstance();
    final _tokenSaved = _localStorage.getString(token);
    final _nameSaved = _localStorage.getString(name);
    final data = {
      'name': _nameSaved,
      'token': _tokenSaved,
    };
    return data;
  }

  @override
  Future logout(String token, String name) async {
    final _localStorage = await SharedPreferences.getInstance();
    await _localStorage.remove(name);
    await _localStorage.remove(token);
  }
}
