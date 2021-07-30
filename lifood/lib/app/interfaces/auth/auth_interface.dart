import '../../../app/models/user.dart';

class IAuth {
  Future<User> register({String name, String email, String password}) async =>
      User();
  Future<User> login({String email, String password}) async => User();
  Future getUser(String token, String name) async {}
  Future logout(String token, String name) async {}
}
