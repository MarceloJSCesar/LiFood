import 'package:flutter/material.dart';
import 'package:lifood/app/components/custom_circular_progress_indicator.dart';
import 'package:lifood/app/config/app_routes_name.dart';
import 'package:lifood/app/config/app_textstyles.dart';
import 'package:lifood/app/interfaces/profile/profile_interface.dart';
import 'package:lifood/app/services/favorite/favorite_service.dart';
import 'package:shimmer/shimmer.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class FavoriteView extends StatelessWidget {
  FavoriteView({Key key}) : super(key: key);

  final _profileServices = FavoriteService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Favorite',
          style: AppTextStyles.homeDateTextStyle,
        ),
      ),
      body: FutureBuilder(
        future: _profileServices.getFavoriteRecipe(
          imageUrl: 'ImageUrl',
          recipeName: 'RecipeName',
          totalTime: 'TotalTime',
          rating: 'Rating',
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Shimmer.fromColors(
                  child: Container(
                    width: MediaQuery.of(context).size.height,
                    margin: const EdgeInsets.only(right: 10),
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, i) {
                        return Card(
                          color: Colors.transparent,
                          child: Container(
                            height: 200,
                            width: 200,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.grey.shade300,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  baseColor: Colors.transparent,
                  highlightColor: Colors.grey);
            default:
              if (snapshot.data['imageUrl'] != null) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Image(
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              snapshot.data['imageUrl'],
                            ),
                          ),
                        ),
                        title: Text(
                          snapshot.data['name'],
                          style: AppTextStyles.homeDetailDescriptionTextStyle,
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              snapshot.data['totalTime'],
                              style:
                                  AppTextStyles.homeDetailDescriptionTextStyle,
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
                                  snapshot.data['rating'].toStringAsFixed(1),
                                  style: AppTextStyles
                                      .homeDetailDescriptionTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    'No favorite recipe yet',
                    style: AppTextStyles.homeDateTextStyle,
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
