import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'screens/acaunt_screen.dart';
import 'screens/my_search.dart';
// import 'screens/search.dart';

class MySliverAppBar extends CustomScrollView {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      primary: true,
      expandedHeight: 45,
      elevation: 4.5,
      forceElevated: true,
      floating: true,
      title: Image.asset(
        'images/yt_logo_rgb_dark.png',
        width: 90,
      ),
      actions: <Widget>[
        IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: Icon(
            Icons.videocam,
            size: 25,
          ),
          onPressed: () {},
        ),
        IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: Icon(
            Icons.search,
            size: 25,
          ),
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                duration: Duration(milliseconds: 50),
                type: PageTransitionType.fade,
                child: Search(),
              ),
            );
          },
        ),
        IconButton(
          splashRadius: 24,
          highlightColor: Colors.grey[500].withOpacity(0.3),
          splashColor: Colors.transparent,
          icon: ClipRRect(
            // child: Image.network('https://lh3.googleusercontent.com/ogw/ADGmqu8r_x3BJ2shfQ59TnXh4LJX7nPO0mPUj5cONbU=s83-c-mo', width: 24,),
            child: Image.asset(
              'images/unnamed.jpg',
              width: 24,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.bottomToTop,
                child: MyAcaunt(),
              ),
            );
          },
        ),
      ],
      backgroundColor: Colors.grey[900],
    );
  }
}
