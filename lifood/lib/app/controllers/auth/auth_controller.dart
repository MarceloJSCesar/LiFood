import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  @observable
  bool isPasswordVisible = false;

  @observable
  bool isLoading = false;

  @action
  void changeVisiblePasswordValue() {
    isPasswordVisible = !isPasswordVisible;
  }

  @action
  void enableIsLoading() {
    isLoading = true;
  }

  @action
  void disableIsLoading() {
    isLoading = false;
  }
}
