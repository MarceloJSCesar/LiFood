import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lifood/app/config/app_textstyles.dart';
import 'package:lifood/app/controllers/home/home_controller.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class DetailsHeader extends StatelessWidget {
  final recipeName;
  final recipeImageUrl;
  final recipeTotalTime;
  final double recipeRating;
  DetailsHeader({
    Key key,
    @required this.recipeName,
    @required this.recipeRating,
    @required this.recipeImageUrl,
    @required this.recipeTotalTime,
  }) : super(key: key);

  HomeController _homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(recipeImageUrl),
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(22),
              bottomRight: Radius.circular(22),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.arrow_back),
                    iconSize: 25,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Observer(
                    builder: (_) {
                      return IconButton(
                          color: _homeController.isRecipeFavorire
                              ? Colors.red
                              : Colors.white,
                          icon: Icon(Icons.favorite),
                          iconSize: 25,
                          onPressed: _homeController.isRecipeFavorire
                              ? () => _homeController.setRecipeToUnFavorite()
                              : () {
                                  _homeController.setRecipeToFavorite();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(seconds: 3),
                                      backgroundColor: Colors.grey,
                                      content:
                                          Text('Recipe added to favorites'),
                                    ),
                                  );
                                });
                    },
                  ),
                ],
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(22),
                    bottomRight: Radius.circular(22),
                  ),
                ),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        recipeName,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.homeDetailDescriptionTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            recipeTotalTime,
                            style: AppTextStyles.homeDetailDescriptionTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Typicons.star,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                recipeRating.toStringAsFixed(1),
                                style: AppTextStyles
                                    .homeDetailDescriptionTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
