import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lifood/app/components/home/drawer/drawer_body.dart';
import 'package:lifood/app/controllers/home/home_controller.dart';
import 'package:shimmer/shimmer.dart';
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
            return Shimmer.fromColors(
                child: Container(
                  width: MediaQuery.of(context).size.height,
                  margin: const EdgeInsets.only(right: 10),
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, i) {
                      return Card(
                        color: Colors.transparent,
                        child: Container(
                          height: 200,
                          width: 200,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.grey.shade300,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                baseColor: Colors.transparent,
                highlightColor: Colors.grey);
          default:
            if (snapshot.data['name'] != null &&
                snapshot.data['token'] != null) {
              return Observer(builder: (context) {
                return Stack(
                  children: <Widget>[
                    DrawerBody(
                      changeValue: () {
                        _homeController.changeDrawerValue();
                      },
                    ),
                    TweenAnimationBuilder(
                      tween: Tween<double>(
                        begin: 0,
                        end: _homeController.drawerValue,
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
                                  _homeController.changeDrawerValue();
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
                    /*
                    GestureDetector(
                      onHorizontalDragUpdate: (e) {
                        if (e.delta.dx > 0) {
                          _homeController.value = 1;
                        } else {
                          _homeController.value = 0;
                        }
                      },
                    ),
                    */
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
