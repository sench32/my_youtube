import 'package:flutter/material.dart';
// import 'package:my_youtube/custom_icons.dart';

import 'custom__icons.dart';
import 'screens/home_screen.dart';
import 'screens/incoming_screen.dart';
import 'screens/library_screen.dart';
import 'screens/navigator_screen.dart';
import 'screens/subscriptions_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  int get currentIndex => _selectedIndex;

  Widget callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return MyHome();
      case 1:
        return MyNavigator();
      case 2:
        return MySubscriptions();
      case 3:
        return MyIncoming();
      case 4:
        return MyLibrary();

        break;
      default:
        return MyHome();
    }
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: callPage(currentIndex),
        bottomNavigationBar: Container(
          constraints: BoxConstraints(maxHeight: 47.8),
          padding: EdgeInsets.fromLTRB(0, 1, 0, 0),
          color: Colors.grey[800],
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              iconSize: 24,
              elevation: 50,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey[600],
              selectedFontSize: 9.5,
              unselectedFontSize: 9.5,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              backgroundColor: Colors.grey[900],
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  title: Text(
                    'Главная',
                    style: TextStyle(),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.explore,
                  ),
                  title: Text(
                    'Навигатор',
                    style: TextStyle(),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Custom_Icons.subscriptions_24px,
                  ),
                  title: Text(
                    'Подписки',
                    style: TextStyle(),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.mail,
                  ),
                  title: Text(
                    'Входящие',
                    style: TextStyle(),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.video_library,
                  ),
                  title: Text(
                    'Библиотека',
                    style: TextStyle(),
                  ),
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: (value) {
                _selectedIndex = value;
                setState(
                  () {},
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
