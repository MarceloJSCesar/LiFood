import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lifood/app/components/custom_circular_progress_indicator.dart';
import 'package:lifood/app/config/app_textstyles.dart';
import 'package:lifood/app/controllers/home/home_controller.dart';
import 'package:lifood/app/interfaces/profile/profile_interface.dart';
import 'package:lifood/app/services/favorite/favorite_service.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class DetailsHeader extends StatefulWidget {
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

  @override
  _DetailsHeaderState createState() => _DetailsHeaderState();
}

class _DetailsHeaderState extends State<DetailsHeader> {
  final _homeController = HomeController();

  final _profileServices = FavoriteService();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return isLoading == false
        ? Column(
            children: <Widget>[
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.recipeImageUrl),
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
                                  ? () {
                                      _homeController.setRecipeToUnFavorite();
                                      _profileServices.deleteFavoriteRecipe(
                                        imageUrl: 'ImageUrl',
                                        recipeName: 'RecipeName',
                                        totalTime: 'TotalTime',
                                        rating: 'Rating',
                                      );
                                    }
                                  : () async {
                                      _homeController.setRecipeToFavorite();
                                      isLoading = true;
                                      await _profileServices.saveFavoriteRecipe(
                                        imageUrl: widget.recipeImageUrl,
                                        recipeName: widget.recipeName,
                                        totalTime: widget.recipeTotalTime,
                                        rating: widget.recipeRating,
                                      );
                                      isLoading = false;
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          duration: Duration(seconds: 3),
                                          backgroundColor: Colors.grey,
                                          content:
                                              Text('Recipe added to favorites'),
                                        ),
                                      );
                                    },
                            );
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
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.recipeName,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  AppTextStyles.homeDetailDescriptionTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  widget.recipeTotalTime,
                                  style: AppTextStyles
                                      .homeDetailDescriptionTextStyle,
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
                                      widget.recipeRating.toStringAsFixed(1),
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
          )
        : Center(
            child: CustomCircularProgressIndicator(),
          );
  }
}
