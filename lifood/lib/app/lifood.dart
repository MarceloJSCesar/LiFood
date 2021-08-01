import 'package:flutter/material.dart';
import 'package:lifood/app/components/custom_circular_progress_indicator.dart';
import 'package:lifood/app/services/auth/auth_service.dart';
import '../app/views/home/home_view.dart';
import '../app/views/auth/login_view.dart';
import '../app/config/app_routes_name.dart';
import '../app/views/splash/splash_view.dart';
import '../app/views/auth/register_view.dart';

class LiFood extends StatelessWidget {
  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _authService.getUser('TOKEN', 'NAME'),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return CustomCircularProgressIndicator();
            default:
              if (snapshot.data['name'] != null &&
                  snapshot.data['token'] != null) {
                print(snapshot.data);
                return HomeView();
              } else {
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
        },
      ),
    );
  }
}
