import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // String get query => _controller.text;
  // set query(String value) {
  //   assert(query != null);
  //   _controller.text = value;
  // }

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onQueryChanged);
  }

  void _onQueryChanged() {
    setState(() {
      if (_controller != null) print(_controller.text.length);
      // rebuild ourselves because query changed.
      // перестроить, потому что запрос изменился.
    });
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
          splashRadius: 25,
          highlightColor: Colors.grey[500].withOpacity(0.2),
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
          margin: (_controller.text.length != 0)
              ? EdgeInsets.fromLTRB(55, 33, 40, 11)
              : EdgeInsets.fromLTRB(55, 33, 50, 11),
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
          (_controller.text.length != 0)
              ? IconButton(
                  splashRadius: 25,
                  highlightColor: Colors.grey[500].withOpacity(0.2),
                  splashColor: Colors.transparent,
                  icon: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                    ),
                    height: 34,
                    width: 34,
                    child: Icon(
                      Icons.clear,
                    ),
                  ),
                  onPressed: () {
                    _controller.clear();
                  },
                )
              : IconButton(
                  splashRadius: 25,
                  highlightColor: Colors.grey[500].withOpacity(0.2),
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
                  onPressed: () {},
                )
        ],
      ),
    );
  }
}
