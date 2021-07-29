import 'package:flutter/material.dart';
import 'views/splash/splash_view.dart';

class LiFood extends StatelessWidget {
  const LiFood({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
