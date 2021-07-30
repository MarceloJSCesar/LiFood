import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  @observable
  bool isPasswordVisible = false;

  @action
  void changeVisiblePasswordValue() {
    isPasswordVisible = !isPasswordVisible;
  }
}
