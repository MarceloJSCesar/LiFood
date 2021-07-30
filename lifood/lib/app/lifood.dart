import 'package:flutter/material.dart';
import 'views/splash/splash_view.dart';
import '../app/views/auth/login_view.dart';
import '../app/config/app_routes_name.dart';
import '../app/views/auth/register_view.dart';

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
