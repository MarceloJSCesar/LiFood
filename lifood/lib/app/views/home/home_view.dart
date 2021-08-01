import 'package:flutter/material.dart';
import 'package:lifood/app/components/custom_circular_progress_indicator.dart';
import 'package:lifood/app/services/auth/auth_service.dart';
import 'package:lifood/app/views/auth/login_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _authService.getUser('TOKEN', 'NAME'),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CustomCircularProgressIndicator();
          default:
            if (snapshot.data['name'] != null &&
                snapshot.data['token'] != null) {
              return Scaffold();
            } else {
              return LoginView();
            }
        }
      },
    );
  }
}
