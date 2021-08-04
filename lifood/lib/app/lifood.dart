import 'package:flutter/material.dart';
import 'package:lifood/app/views/app_view.dart';
import '../app/views/home/home_view.dart';
import '../app/views/auth/login_view.dart';
import '../app/config/app_routes_name.dart';
import '../app/views/splash/splash_view.dart';
import '../app/views/auth/register_view.dart';
import '../app/services/auth/auth_service.dart';
import '../app/components/custom_circular_progress_indicator.dart';

class LiFood extends StatelessWidget {
  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _authService.getUser('TOKEN', 'NAME'),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: CustomCircularProgressIndicator(),
            );
          default:
            if (snapshot.data['name'] != null &&
                snapshot.data['token'] != null) {
              print(snapshot.data);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: AppView(),
                theme: ThemeData(
                  brightness: Brightness.dark,
                ),
              );
            } else {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: AppRoutesNames.toInitialRoute,
                routes: {
                  AppRoutesNames.toAppView: (_) => AppView(),
                  AppRoutesNames.toHomeView: (_) => HomeView(),
                  AppRoutesNames.toLoginView: (_) => LoginView(),
                  AppRoutesNames.toInitialRoute: (_) => SplashView(),
                  AppRoutesNames.toRegisterView: (_) => RegisterView(),
                },
              );
            }
        }
      },
    );
  }
}
