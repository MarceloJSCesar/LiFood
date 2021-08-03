import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lifood/app/config/app_routes_name.dart';
import 'package:lifood/app/config/app_textstyles.dart';
import 'package:lifood/app/controllers/home/home_controller.dart';
import 'package:lifood/app/views/home/recipes/recipe_done_view.dart';

class RecipeSteps extends StatefulWidget {
  final preparationSteps;
  const RecipeSteps({
    Key key,
    @required this.preparationSteps,
  }) : super(key: key);

  @override
  _RecipeStepsState createState() => _RecipeStepsState();
}

class _RecipeStepsState extends State<RecipeSteps> {
  final _homeController = HomeController();

  int index = 0;
  double value = 0.0;

  @override
  Widget build(BuildContext context) {
    return index < widget.preparationSteps.length
        ? Scaffold(
            backgroundColor: Colors.black,
            body: Observer(
              builder: (context) {
                return SafeArea(
                  child: Column(
                    children: <Widget>[
                      LinearProgressIndicator(
                        value: index < widget.preparationSteps.length
                            ? value
                            : 0.0,
                        color: Colors.lightBlue,
                        backgroundColor: Colors.white,
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
                              icon: Icon(
                                Icons.clear,
                                size: 24,
                              ),
                              color: Colors.white,
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            index > 0
                                ? IconButton(
                                    icon: Icon(
                                      Icons.arrow_back,
                                      size: 24,
                                    ),
                                    color: Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        index -= 1;
                                        value -= 0.15;
                                      });
                                    })
                                : Container(),
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: Card(
                          clipBehavior: Clip.none,
                          shadowColor: Colors.white,
                          color: Colors.grey[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  index < widget.preparationSteps.length
                                      ? 'Step $index'
                                      : 'no more step',
                                  style: AppTextStyles
                                      .homeDetailStepsTitleTextStyle,
                                ),
                                SizedBox(height: 13),
                                Text(
                                  index < widget.preparationSteps.length
                                      ? widget.preparationSteps[index]
                                      : 'Click Next, just to make sure you are following right',
                                  style: AppTextStyles.homeDetailStepsTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                );
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton.extended(
                label: Text(
                  'Next',
                  style: AppTextStyles.homeDetailIngredientsButtonTextStyle,
                ),
                backgroundColor: Colors.lightBlue,
                onPressed: () {
                  setState(() {
                    index += 1;
                    value += 0.15;
                  });
                }),
          )
        : RecipeDoneView();
  }
}
