import 'package:flutter/material.dart';
import '../../../app/config/app_textstyles.dart';
import '../../../app/config/app_routes_name.dart';
import '../../../app/config/app_image_assets.dart';
import '../../../app/components/splash/splashButton.dart';

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
              filterQuality: FilterQuality.high,
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
                        onTap: () => Navigator.of(context).pushReplacementNamed(
                          AppRoutesNames.toRegisterRoute,
                        ),
                      ),
                      SplashButton(
                        text: 'Sign In',
                        onTap: () => Navigator.of(context).pushReplacementNamed(
                          AppRoutesNames.toLoginRoute,
                        ),
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
