import 'package:flutter/material.dart';
import 'package:lifood/app/components/splash/splashButton.dart';
import 'package:lifood/app/config/app_image_assets.dart';
import 'package:lifood/app/config/app_textstyles.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            Image(
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height - 25,
              width: MediaQuery.of(context).size.width,
              image: AssetImage(AppImagesAssets.splashImagePath),
            ),
            Align(
              alignment: Alignment.topRight,
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    child: Text(
                      'Skip',
                      style: AppTextStyles.authTextStyle,
                    ),
                    onTap: () => print('skip button taped'),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SplashButton(
                        text: 'Sign Up',
                      ),
                      SplashButton(
                        text: 'Sign In',
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ));
  }
}
