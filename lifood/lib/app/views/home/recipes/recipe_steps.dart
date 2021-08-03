import 'package:flutter/material.dart';
import 'package:lifood/app/config/app_routes_name.dart';
import 'package:lifood/app/config/app_textstyles.dart';
import 'package:lifood/app/controllers/home/home_controller.dart';

class RecipeSteps extends StatelessWidget {
  final preparationSteps;
  const RecipeSteps({
    Key key,
    @required this.preparationSteps,
  }) : super(key: key);

  int get index => HomeController().detailsStepsIndex;
  double get value => HomeController().detailsStepsValue;
  void get increaseIndex => HomeController().increaseDetailsStepsIndex();
  void get decreaseIndex => HomeController().decreaseDetailsStepsIndex();

  void get increaseValue => HomeController().increaseDetailsStepsValue();
  void get decreaseValue => HomeController().decreaseDetailsStepsValue();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: index < preparationSteps.length
          ? SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    LinearProgressIndicator(
                      value: value,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: index == 0
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.remove),
                            color: Colors.white,
                            onPressed: () => Navigator.of(context)
                                .pushReplacementNamed(
                                    AppRoutesNames.toHomeView),
                          ),
                          index > 0
                              ? BackButton(
                                  color: Colors.black,
                                  onPressed: () {
                                    decreaseIndex;
                                    decreaseValue;
                                  },
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    Text(
                      'Step $index',
                      style: AppTextStyles.homeDetailIngredientsTitleTextStyle,
                    ),
                    SizedBox(height: 13),
                    Text(
                      preparationSteps[index],
                      style: AppTextStyles.homeDetailDescriptionTextStyle,
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://giphy.com/gifs/redgiantnews-hooray-trapcode-you-did-it-iJc5ynT1VwAUPN55e6/links#:~:text=https%3A//media.giphy.com/media/iJc5ynT1VwAUPN55e6/giphy.gif'),
                      ),
                    ),
                  ),
                  Text(
                    'Well Done ! I want to test it',
                    style: AppTextStyles.homeDetailDescriptionTextStyle,
                  ),
                ],
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          label: Text(
            'Next',
            style: AppTextStyles.homeDetailIngredientsButtonTextStyle,
          ),
          backgroundColor: Colors.lightBlue,
          onPressed: () {
            increaseIndex;
            increaseValue;
          }),
    );
  }
}
