import 'package:flutter/material.dart';
import 'package:lifood/app/components/home/details/details_header.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class RecipeDetail extends StatelessWidget {
  final recipeName;
  final double recipeRating;
  final recipeImageUrl;
  final recipeTotalTime;
  const RecipeDetail({
    Key key,
    @required this.recipeName,
    @required this.recipeRating,
    @required this.recipeImageUrl,
    @required this.recipeTotalTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            DetailsHeader(
              recipeName: recipeName,
              recipeRating: recipeRating,
              recipeImageUrl: recipeImageUrl,
              recipeTotalTime: recipeTotalTime,
            )
          ],
        )),
      ),
    );
  }
}
