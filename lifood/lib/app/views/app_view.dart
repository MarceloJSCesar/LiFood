import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifood/app/views/favorite/favorite_view.dart';
import 'package:lifood/app/views/home/home_view.dart';
import 'package:lifood/app/views/profile/profile_view.dart';

class AppView extends StatefulWidget {
  const AppView({Key key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  PageController _pageController;
  List<Widget> _pages;
  int _selectedPage;

  @override
  void initState() {
    super.initState();
    _selectedPage = 0;
    _pages = [
      HomeView(),
      FavoriteView(),
      ProfileView(),
    ];
    _pageController = PageController(initialPage: _selectedPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        controller: _pageController,
        children: _pages,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CupertinoTabBar(
            currentIndex: _selectedPage,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home)),
              BottomNavigationBarItem(icon: Icon(Icons.favorite)),
              BottomNavigationBarItem(icon: Icon(Icons.person)),
            ],
            activeColor: Colors.lightBlue,
            inactiveColor: Colors.grey,
            backgroundColor: Colors.grey[900],
            onTap: (selectedPageIndex) {
              setState(() {
                _selectedPage = selectedPageIndex;
                _pageController.jumpToPage(selectedPageIndex);
              });
            },
          ),
        ),
      ),
    );
  }
}
