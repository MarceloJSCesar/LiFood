import 'package:flutter/material.dart';
import 'package:lifood/app/components/custom_circular_progress_indicator.dart';
import 'package:lifood/app/components/profile/profile_header.dart';
import 'package:lifood/app/config/app_image_assets.dart';
import 'package:lifood/app/config/app_textstyles.dart';
import 'package:lifood/app/services/auth/auth_service.dart';
import 'package:lifood/app/services/home/home_service.dart';
import 'package:shimmer/shimmer.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String userName;

  @override
  void initState() {
    super.initState();
    AuthService()
        .getUser('TOKEN', 'NAME')
        .then((data) => userName = data['name']);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HomeService().getListRecipies(),
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
            final details = snapshot.data[0];
            final reviews = snapshot.data[1];
            if (snapshot.data != null) {
              return Scaffold(
                backgroundColor: Colors.black,
                body: SafeArea(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ProfileHeader(userName: userName),
                        SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Food Made',
                              style: AppTextStyles.profileTitleTextStyle,
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: MediaQuery.of(context).size.height,
                              margin: const EdgeInsets.only(right: 10),
                              height: 350,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Card(
                                    color: Colors.transparent,
                                    child: Container(
                                      height: 350,
                                      width: 350,
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            details[index]['images'][0]
                                                ['hostedLargeUrl'],
                                          ),
                                        ),
                                      ),
                                      child: Container(
                                        height: 55,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.4),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(16),
                                            bottomRight: Radius.circular(16),
                                          ),
                                        ),
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 6),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              Text(
                                                details[index]['name'],
                                                overflow: TextOverflow.ellipsis,
                                                style: AppTextStyles
                                                    .homeDetailDescriptionTextStyle,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    details[index]['totalTime'],
                                                    style: AppTextStyles
                                                        .homeDetailDescriptionTextStyle,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
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
                                                        reviews[index][
                                                                'averageRating']
                                                            .toStringAsFixed(1),
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
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: CustomCircularProgressIndicator(),
              );
            }
        }
      },
    );
  }
}
