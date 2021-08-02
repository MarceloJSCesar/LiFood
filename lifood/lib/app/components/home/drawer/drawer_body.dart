import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lifood/app/config/app_image_assets.dart';
import 'package:lifood/app/config/app_textstyles.dart';
import 'package:lifood/app/controllers/home/home_controller.dart';
import 'package:lifood/app/services/auth/auth_service.dart';
import 'package:lifood/app/services/home/home_service.dart';
import 'package:shimmer/shimmer.dart';

class DrawerBody extends StatefulWidget {
  final Function changeValue;
  const DrawerBody({
    Key key,
    this.changeValue,
  }) : super(key: key);

  @override
  _DrawerBodyState createState() => _DrawerBodyState();
}

class _DrawerBodyState extends State<DrawerBody> {
  final _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _authService.getUser('TOKEN', 'NAME'),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Shimmer.fromColors(
                child: Container(
                  width: MediaQuery.of(context).size.height,
                  margin: const EdgeInsets.only(right: 10),
                  height: 300,
                  child: Card(
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
                  ),
                ),
                baseColor: Colors.transparent,
                highlightColor: Colors.grey);
          default:
            final data = snapshot.data;
            if (snapshot.data != null) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      AppImagesAssets.splashImagePath,
                    ),
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 8.0, sigmaX: 8.0),
                  child: Container(
                    color: Colors.black.withOpacity(0.3),
                    child: SafeArea(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              child: Icon(
                                Icons.arrow_back,
                                size: 30,
                              ),
                              onTap: () => widget.changeValue(),
                            ),
                            SizedBox(height: 20),
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                AppImagesAssets.homePersonPath,
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              data['name'],
                              style: AppTextStyles.authBottomTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Shimmer.fromColors(
                child: Container(
                  width: MediaQuery.of(context).size.height,
                  margin: const EdgeInsets.only(right: 10),
                  height: 300,
                  child: Card(
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
                  ),
                ),
                baseColor: Colors.transparent,
                highlightColor: Colors.grey,
              );
            }
        }
      },
    );
  }
}
