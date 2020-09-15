import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: Colors.black87,
        elevation: 8,
        backgroundColor: Colors.grey[800],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          height: 40,
          color: Colors.grey[600],
          child: TextField(
            style: TextStyle(color: Colors.white),
            autofocus: true,
            cursorColor: Colors.red,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 13),
                border: InputBorder.none,
                hintText: 'Поиск',
                hintStyle: TextStyle(color: Colors.white)),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 7),
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[600],
            ),
            child: IconButton(
              icon: Icon(
                Icons.mic,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
