import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lifood/app/config/app_image_assets.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 05.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
            ),
            child: Column(
              children: <Widget>[],
            ),
          ),
        ),
      ),
    );
  }
}
