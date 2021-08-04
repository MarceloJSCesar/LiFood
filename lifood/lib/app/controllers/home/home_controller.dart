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

  @observable
  int detailsStepsIndex = 0;

  @action
  void increaseDetailsStepsIndexAndValue() {
    detailsStepsIndex += 1;
    detailsStepsValue += 0.1;
  }

  @action
  void decreaseDetailsStepsIndexAndValue() {
    detailsStepsIndex -= 1;
    detailsStepsValue -= 0.1;
  }

  @observable
  bool isRecipeFavorire = false;

  @action
  void setRecipeToFavorite() {
    isRecipeFavorire = true;
  }

  @action
  void setRecipeToUnFavorite() {
    isRecipeFavorire = false;
  }
}
