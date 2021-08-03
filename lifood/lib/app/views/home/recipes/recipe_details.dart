import 'package:flutter/material.dart';
import 'package:lifood/app/components/home/details/details_header.dart';
import 'package:lifood/app/config/app_textstyles.dart';
import 'package:lifood/app/views/home/recipes/recipe_steps.dart';
import 'package:shimmer/shimmer.dart';

class RecipeDetail extends StatefulWidget {
  final recipeName;
  final ingredients;
  final description;
  final recipeImageUrl;
  final recipeTotalTime;
  final preparationSteps;
  final double recipeRating;
  RecipeDetail({
    Key key,
    @required this.recipeName,
    @required this.ingredients,
    @required this.description,
    @required this.recipeRating,
    @required this.recipeImageUrl,
    @required this.recipeTotalTime,
    @required this.preparationSteps,
  }) : super(key: key);

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  List ingredientList = [];
  void getRecipeIngridients() {
    for (int a = 0; a < widget.ingredients.length; a++) {
      ingredientList.add(widget.ingredients[a]['ingredient']);
    }
  }

  @override
  void initState() {
    super.initState();
    getRecipeIngridients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            DetailsHeader(
              recipeName: widget.recipeName,
              recipeRating: widget.recipeRating,
              recipeImageUrl: widget.recipeImageUrl,
              recipeTotalTime: widget.recipeTotalTime,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                widget.description,
                style: AppTextStyles.homeDetailDescriptionTextStyle,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Text(
                    'Ingredients',
                    style: AppTextStyles.homeDetailIngredientsTitleTextStyle,
                  ),
                ),
                ...ingredientList
                    .map(
                      (ingredient) => Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.white,
                            ),
                            Text(
                              ingredient,
                              style:
                                  AppTextStyles.homeDetailDescriptionTextStyle,
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ],
            )
          ],
        )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          'Start',
          style: AppTextStyles.homeDetailIngredientsButtonTextStyle,
        ),
        backgroundColor: Colors.lightBlue,
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => RecipeSteps(
              preparationSteps: widget.preparationSteps,
            ),
          ),
        ),
      ),
    );
  }
}
