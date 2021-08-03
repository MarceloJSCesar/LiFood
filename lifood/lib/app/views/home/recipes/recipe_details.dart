import 'package:flutter/material.dart';
import 'package:lifood/app/components/home/details/details_header.dart';
import 'package:shimmer/shimmer.dart';

class RecipeDetail extends StatefulWidget {
  final recipeName;
  final ingredients;
  final description;
  final recipeImageUrl;
  final recipeTotalTime;
  final double recipeRating;
  RecipeDetail({
    Key key,
    @required this.recipeName,
    @required this.ingredients,
    @required this.description,
    @required this.recipeRating,
    @required this.recipeImageUrl,
    @required this.recipeTotalTime,
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
              child: Text(widget.description),
            ),
            Column(
              children: <Widget>[
                ...ingredientList
                    .map((ingredient) => Row(
                          children: <Widget>[
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.white,
                            ),
                            Text(ingredient.toString()),
                          ],
                        ))
                    .toList(),
              ],
            )
          ],
        )),
      ),
    );
  }
}
