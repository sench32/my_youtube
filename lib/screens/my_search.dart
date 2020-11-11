import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: Colors.black87,
        elevation: 8,
        backgroundColor: Colors.grey[800],
        leading: IconButton(
          splashRadius: 24,
          highlightColor: Colors.grey[500].withOpacity(0.3),
          splashColor: Colors.transparent,
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        flexibleSpace: Container(
          margin: EdgeInsets.fromLTRB(55, 35, 50, 11),
          padding: EdgeInsets.fromLTRB(6, 0, 0, 0),
          height: 40,
          color: Colors.grey[600],
          child: TextField(
            controller: _controller,
            style: TextStyle(color: Colors.white, fontSize: 16),
            autofocus: true,
            cursorColor: Colors.red,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[600],
              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 14),
              border: InputBorder.none,
              hintText: 'Поиск',
              hintStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            splashRadius: 24,
            highlightColor: Colors.grey[500].withOpacity(0.3),
            splashColor: Colors.transparent,
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[600],
              ),
              height: 34,
              width: 34,
              child: Icon(
                Icons.mic,
              ),
            ),
            onPressed: () {
              _controller.clear();
            },
          ),
        ],
      ),
    );
  }
}
