import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../app/views/auth/login_view.dart';
import '../../../app/components/home/home_body.dart';
import '../../../app/services/auth/auth_service.dart';
import '../../../app/components/custom_circular_progress_indicator.dart';

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
              return Scaffold(
                backgroundColor: Colors.black,
                body: SafeArea(
                  child: HomeBody(),
                ),
                bottomNavigationBar: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CupertinoTabBar(
                      items: [
                        BottomNavigationBarItem(icon: Icon(Icons.home)),
                        BottomNavigationBarItem(icon: Icon(Icons.favorite)),
                        BottomNavigationBarItem(icon: Icon(Icons.person)),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return LoginView();
            }
        }
      },
    );
  }
}
