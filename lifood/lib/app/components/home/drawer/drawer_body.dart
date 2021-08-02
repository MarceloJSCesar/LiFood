import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lifood/app/config/app_image_assets.dart';
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
          child: Container(
            child: Text('hi'),
          ),
        ),
      ),
    );
  }
}
/*
Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: BackButton(
                  color: Colors.white,
                  onPressed: () => widget.changeValue(),
                ),
              ),
              FutureBuilder(
                future: _authService.getUser('TOKEN', 'NAME'),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return CircularProgressIndicator();
                    default:
                      final data = snapshot.data;
                      print(data);
                      if (snapshot.data != null) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 28,
                              backgroundImage: NetworkImage(
                                AppImagesAssets.homePersonPath,
                              ),
                            ),
                            Text(data['name']),
                          ],
                        );
                      } else {
                        return Center(
                          child: Text('no data'),
                        );
                      }
                  }
                },
              ),
            ],
          ),
*/