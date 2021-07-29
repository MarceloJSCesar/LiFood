import 'package:flutter/material.dart';
import 'package:lifood/app/config/app_routes_name.dart';
import 'package:lifood/app/views/auth/login_view.dart';
import 'package:lifood/app/views/auth/register_view.dart';
import 'views/splash/splash_view.dart';

class LiFood extends StatelessWidget {
  const LiFood({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutesNames.initialRoute,
      routes: {
        AppRoutesNames.initialRoute: (_) => SplashView(),
        AppRoutesNames.toLoginRoute: (_) => LoginView(),
        AppRoutesNames.toRegisterRoute: (_) => RegisterView(),
      },
    );
  }
}
