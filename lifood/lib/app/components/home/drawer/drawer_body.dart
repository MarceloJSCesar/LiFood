import 'package:flutter/material.dart';
import 'package:lifood/app/config/app_image_assets.dart';
import 'package:lifood/app/controllers/home/home_controller.dart';

class DrawerBody extends StatefulWidget {
  const DrawerBody({Key key}) : super(key: key);

  @override
  _DrawerBodyState createState() => _DrawerBodyState();
}

class _DrawerBodyState extends State<DrawerBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: BackButton(
                  color: Colors.white,
                  onPressed: () =>
                      setState(() => HomeController().changeValue()),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(
                      AppImagesAssets.homePersonPath,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
