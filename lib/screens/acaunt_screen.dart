// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// import 'package:my_youtube/custom_icons.dart';

import '../custom__icons.dart';

class MyAcaunt extends StatefulWidget {
  @override
  _MyAcauntState createState() => _MyAcauntState();
}

class _MyAcauntState extends State<MyAcaunt> {
  String name = 'YouTube';

  bool isPressd;

  final _formKey = GlobalKey<FormState>();

  final background = Colors.grey[850];
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          elevation: 4.5,
          backgroundColor: background,
          leading: IconButton(
            padding: EdgeInsets.only(left: 1),
            icon: Icon(Icons.close),
            iconSize: 25,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Аккаунт',
            style: TextStyle(
              fontSize: 19,
            ),
          ),
        ),
        body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 14),
              ),
              Container(
                child: FlatButton(
                  highlightColor: Colors.white12,
                  splashColor: Colors.transparent,
                  child: Row(
                    children: [
                      IconButton(
                        splashRadius: 0.1,
                        icon: ClipRRect(
                          // child: Image.network('https://lh3.googleusercontent.com/ogw/ADGmqu8r_x3BJ2shfQ59TnXh4LJX7nPO0mPUj5cONbU=s83-c-mo', width: 24,),
                          child: Image.asset(
                            'images/unnamed.jpg',
                            width: 70,
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Сергей',
                                style: TextStyle(
                                    fontSize: 17.5, color: Colors.white),
                              ),
                              Icon(
                                Icons.expand_more,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          Text(
                            'sench32@gmail.com',
                            style:
                                TextStyle(fontSize: 17.5, color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            backgroundColor: background,
                            content: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(20, 0, 3, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Аккаунт',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 19),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            MyColorIconButton(),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                  ),
                                  ListTile(
                                    title: Padding(
                                      padding: EdgeInsets.only(left: 6.0),
                                      child: Text(
                                        'Управление аккаунтами',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 17.5,
                                            color: Colors.white),
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                  ListTile(
                                    title: Padding(
                                      padding: EdgeInsets.only(left: 6.0),
                                      child: Text(
                                        'О настройках аккаунта',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 17.5, color: Colors.blue),
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: 73.5,
                      height: 23,
                    ),
                    Theme(
                      data: ThemeData(
                          highlightColor: Colors.white12,
                          splashColor: Colors.transparent),
                      child: Container(
                        width: 212,
                        height: 18,
                        child: InkWell(
                          child: Text(
                            'Управление аккаунтом Google'
                                .replaceAll(' ', '\u00A0'),
                            style: TextStyle(fontSize: 14, color: Colors.blue),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              Divider(
                height: 1.2,
                color: Colors.grey,
              ),
              Container(
                height: 49,
                child: InkWell(
                  highlightColor: Colors.white12,
                  splashColor: Colors.transparent,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24.5),
                      ),
                      Icon(
                        Icons.account_box,
                        size: 24.5,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24.5),
                      ),
                      Text(
                        'Мой канал',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 17.5, color: Colors.white),
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ),
              Container(
                height: 49,
                child: InkWell(
                  highlightColor: Colors.white12,
                  splashColor: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 24),
                            ),
                            Icon(
                              Custom_Icons.creative_studio_24px,
                              size: 24.5,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 24),
                            ),
                            Flexible(
                              child: Text(
                                'Творческая студия $name'
                                    .replaceAll(' ', '\u00A0'),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                softWrap: false,
                                style: TextStyle(
                                    fontSize: 17.5, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16),
                          ),
                          Icon(
                            Icons.open_in_new,
                            size: 24.5,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                  onTap: () {},
                ),
              ),
              Container(
                height: 49,
                child: InkWell(
                  highlightColor: Colors.white12,
                  splashColor: Colors.transparent,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24),
                      ),
                      Icon(
                        Icons.insert_chart,
                        size: 24.5,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24),
                      ),
                      Text(
                        'Время просмотра',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 17.5, color: Colors.white),
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ),
              Container(
                height: 49,
                child: InkWell(
                  highlightColor: Colors.white12,
                  splashColor: Colors.transparent,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 22.5),
                      ),
                      Icon(
                        Custom_Icons.premium,
                        size: 28.5,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 22.5),
                      ),
                      Text(
                        'Оформить $name Premium',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 17.5, color: Colors.white),
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ),
              Container(
                height: 49,
                child: InkWell(
                  highlightColor: Colors.white12,
                  splashColor: Colors.transparent,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24.2),
                      ),
                      Icon(
                        Icons.monetization_on,
                        size: 24.5,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24.2),
                      ),
                      Text(
                        'Платные подписки',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 17.5, color: Colors.white),
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ),
              Container(
                height: 49,
                child: InkWell(
                  highlightColor: Colors.white12,
                  splashColor: Colors.transparent,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24.5),
                      ),
                      Icon(
                        Custom_Icons.account_change_24px,
                        size: 24.5,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24.5),
                      ),
                      Text(
                        'Сменить аккаунт',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 17.5, color: Colors.white),
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ),
              Container(
                height: 49,
                child: InkWell(
                  highlightColor: Colors.white12,
                  splashColor: Colors.transparent,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 22),
                      ),
                      Icon(
                        Custom_Icons.incognito_mode_24px,
                        size: 30,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 22),
                      ),
                      Text(
                        'Включи режим инкогнито',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 17.5, color: Colors.white),
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ),
              Container(
                height: 49,
                child: InkWell(
                  highlightColor: Colors.white12,
                  splashColor: Colors.transparent,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24.5),
                      ),
                      Icon(
                        Custom_Icons.personal_data_24px,
                        size: 24.5,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24.5),
                      ),
                      Text(
                        'Личные данные на $name',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 17.5, color: Colors.white),
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Container(
                height: 49,
                child: InkWell(
                  highlightColor: Colors.white12,
                  splashColor: Colors.transparent,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24.5),
                      ),
                      Icon(
                        Icons.settings,
                        size: 24.5,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24.5),
                      ),
                      Text(
                        'Настройки',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 17.5, color: Colors.white),
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ),
              Container(
                height: 49,
                child: InkWell(
                  highlightColor: Colors.white12,
                  splashColor: Colors.transparent,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24.5),
                      ),
                      Icon(
                        Icons.help,
                        size: 24.5,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24.5),
                      ),
                      Text(
                        'Справка/отзыв',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 17.5, color: Colors.white),
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ),
              Container(
                height: 18,
                child: InkWell(
                  highlightColor: Colors.white12,
                  splashColor: Colors.transparent,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24.5),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24.5),
                      ),
                      Text(
                        '',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 17.5, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          height: 24,
          color: background,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Политика кофидициальности',
                style: TextStyle(
                  color: Colors.grey,
                  backgroundColor: background,
                  fontSize: 12,
                ),
              ),
              Text(
                ' \u2022 ',
                style: TextStyle(
                    color: Colors.grey,
                    backgroundColor: background,
                    fontSize: 12),
              ),
              Text(
                'Условия использования',
                style: TextStyle(
                    color: Colors.grey,
                    backgroundColor: background,
                    fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Убираем "splash-след" прокрутки
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class MyColorIconButton extends StatefulWidget {
  @override
  _MyColorIconButtonState createState() => _MyColorIconButtonState();
}

class _MyColorIconButtonState extends State<MyColorIconButton> {
  int index = 0;
  Color _iconColorGrey = Colors.grey;
  var mycoloricon = [Colors.grey, Colors.red];

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        setState(() {
          // index = 1;
          _iconColorGrey = Colors.red;
        });
        // print('Down');
      },
      onPointerUp: (event) {
        setState(() {
          // index=0;
          _iconColorGrey = Colors.grey;
        });
        // print('Up');
      },
      child: IconButton(
        // tooltip: MaterialLocalizations.of(context).showAccountsLabel,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        icon: Icon(
          Icons.add,
          color: _iconColorGrey,
          // mycoloricon[index],
        ),
        onPressed: () {
          //   // _iconColorGrey = Colors.red;
          //   print('Test1');
          //   // _iconColorGrey = Colors.grey;
          //   print('Test2');
        },
      ),
    );
  }
}
