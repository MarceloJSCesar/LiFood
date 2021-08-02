import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lifood/app/components/home/drawer/drawer_body.dart';
import 'package:lifood/app/controllers/home/home_controller.dart';
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
  final _homeController = HomeController();
  double value = 0;
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
              return Observer(builder: (context) {
                return Stack(
                  children: <Widget>[
                    DrawerBody(
                      changeValue: () {
                        _homeController.changeValue();
                      },
                    ),
                    TweenAnimationBuilder(
                      tween: Tween<double>(
                        begin: 0,
                        end: _homeController.value,
                      ),
                      duration: Duration(
                        milliseconds: 500,
                      ),
                      builder: (context, val, child) {
                        return (Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..setEntry(0, 3, 200 * val)
                            ..rotateY((pi / 6) * val),
                          child: Scaffold(
                            backgroundColor: Colors.black,
                            body: SafeArea(
                              child: HomeBody(
                                changeValue: () {
                                  _homeController.changeValue();
                                },
                              ),
                            ),
                            bottomNavigationBar: Container(
                              color: Colors.transparent,
                              margin: const EdgeInsets.only(bottom: 20),
                              padding: const EdgeInsets.all(10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CupertinoTabBar(
                                  items: <BottomNavigationBarItem>[
                                    BottomNavigationBarItem(
                                        icon: Icon(Icons.home)),
                                    BottomNavigationBarItem(
                                        icon: Icon(Icons.favorite)),
                                    BottomNavigationBarItem(
                                        icon: Icon(Icons.person)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ));
                      },
                    ),
                  ],
                );
              });
            } else {
              return LoginView();
            }
        }
      },
    );
  }
}
