import '../../../app/models/user.dart';

class IAuth {
  Future<User> login({String name, String email, String password}) async =>
      User();
  Future getUser(String token) async {}
  Future logout(String token) async {}
}
