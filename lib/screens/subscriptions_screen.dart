import 'package:flutter/material.dart';

import '../my_sliver_app_bar.dart';
import 'acaunt_screen.dart';

class MySubscriptions extends StatefulWidget {
  MySubscriptions({Key key}) : super(key: key);

  @override
  _MySubscriptionsState createState() => _MySubscriptionsState();
}

class _MySubscriptionsState extends State<MySubscriptions> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.white,
      backgroundColor: Colors.black,
      onRefresh: () async {
        return await Future.delayed(
          Duration(seconds: 3),
        );
      },
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: CustomScrollView(
          slivers: <Widget>[
            MySliverAppBar(),
            SliverFixedExtentList(
              itemExtent: 300.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    child: Center(
                      child: Text(
                        'Подписки',
                        style: TextStyle(fontSize: 56, color: Colors.white),
                      ),
                    ),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0.1),
                    color: Colors.grey.shade900,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
