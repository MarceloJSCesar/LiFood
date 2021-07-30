import 'package:flutter/material.dart';
import '../app/views/home/home_view.dart';
import '../app/views/auth/login_view.dart';
import '../app/config/app_routes_name.dart';
import '../app/views/splash/splash_view.dart';
import '../app/views/auth/register_view.dart';

class LiFood extends StatelessWidget {
  const LiFood({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutesNames.toInitialRoute,
      routes: {
        AppRoutesNames.toInitialRoute: (_) => SplashView(),
        AppRoutesNames.toHomeView: (_) => HomeView(),
        AppRoutesNames.toLoginView: (_) => LoginView(),
        AppRoutesNames.toRegisterView: (_) => RegisterView(),
      },
    );
  }
}
