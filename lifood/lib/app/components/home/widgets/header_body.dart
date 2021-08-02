import 'package:flutter/material.dart';
import 'package:lifood/app/components/home/widgets/body_title.dart';
import 'package:lifood/app/components/home/widgets/categories_button.dart';
import 'package:lifood/app/components/home/widgets/recipe_card.dart';

class HeaderBody extends StatelessWidget {
  final dynamic data;
  const HeaderBody({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 45,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              CategoriesButton(
                categorieTitle: 'All',
                isButtonSelected: true,
              ),
              SizedBox(width: 8),
              CategoriesButton(
                categorieTitle: 'Vegetables',
              ),
              SizedBox(width: 8),
              CategoriesButton(
                categorieTitle: 'Protein',
              ),
              SizedBox(width: 8),
              CategoriesButton(
                categorieTitle: 'Fruits',
              ),
              SizedBox(width: 8),
              CategoriesButton(
                categorieTitle: 'Grains',
              ),
              SizedBox(width: 8),
              CategoriesButton(
                categorieTitle: 'Dairy',
              ),
            ],
          ),
        ),
        BodyTitle(
          text: 'Categories',
        ),
        RecipeCard(
          data: data,
        ),
      ],
    );
  }
}