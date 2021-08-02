import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  @observable
  double value = 0;

  @action
  void changeValue() {
    value == 0 ? value = 1 : value = 0;
  }
}
