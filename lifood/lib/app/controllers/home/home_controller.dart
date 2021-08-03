import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  @observable
  double drawerValue = 0;

  @action
  void changeDrawerValue() {
    drawerValue == 0 ? drawerValue = 1 : drawerValue = 0;
  }

  @observable
  double detailsStepsValue = 0.0;

  @action
  void increaseDetailsStepsValue() {
    detailsStepsValue += 0.1;
  }

  @action
  void decreaseDetailsStepsValue() {
    detailsStepsValue -= 0.1;
  }

  @observable
  int detailsStepsIndex = 0;

  @action
  void increaseDetailsStepsIndex() {
    detailsStepsIndex += 1;
  }

  @action
  void decreaseDetailsStepsIndex() {
    detailsStepsIndex -= 1;
  }
}
