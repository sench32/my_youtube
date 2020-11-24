import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../custom__icons.dart';
import 'speech_to_text.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _controller = TextEditingController();
  var titles = [];

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onQueryChanged);
  }

  void _onQueryChanged() {
    setState(() {
      // if (_controller != null) print(_controller.text.length);
      // rebuild ourselves because query changed.
      // перестроить, потому что запрос изменился.
    });
  }

  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: Colors.black87,
        elevation: 4,
        backgroundColor: Colors.grey.shade900,
        leading: IconButton(
          splashRadius: 25,
          highlightColor: Colors.grey[600].withOpacity(0.2),
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
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(3),
            border: Border.all(color: Colors.grey[800]),
          ),
          margin: (_controller.text.length != 0)
              ? EdgeInsets.fromLTRB(54, 33, 7, 11)
              : EdgeInsets.fromLTRB(54, 33, 50, 11),
          padding: EdgeInsets.fromLTRB(6, 0, 0, 0),
          height: 40,
          child: (_controller.text.length != 0)
              ? TextField(
                  controller: _controller,
                  onSubmitted: (String value) async {
                    titles.add(_controller.text);
                    _controller.clear();
                    // showDialog<void>(
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return AlertDialog(
                    //       title: const Text('Thanks!'),
                    //       content: Text('You typed "$value".'),
                    //       actions: <Widget>[
                    //         FlatButton(
                    //           onPressed: () {
                    //             Navigator.pop(context);
                    //           },
                    //           child: const Text('OK'),
                    //         ),
                    //       ],
                    //     );
                    //   },
                    // );
                  },
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  autofocus: true,
                  showCursor: true,
                  cursorHeight: 22,
                  cursorWidth: 1.5,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                    suffix: SizedBox(
                      width: 38,
                    ),
                    filled: true,
                    fillColor: Colors.grey[800],
                    contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 14),
                    border: InputBorder.none,
                    hintText: 'Поиск',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              : TextField(
                  controller: _controller,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  autofocus: true,
                  showCursor: true,
                  cursorHeight: 22,
                  cursorWidth: 1.5,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[800],
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
                  splashRadius: 24,
                  highlightColor: Colors.grey[600].withOpacity(0.2),
                  splashColor: Colors.transparent,
                  icon: Container(
                    height: 40,
                    width: 40,
                    child: Icon(
                      Icons.clear,
                    ),
                  ),
                  onPressed: () {
                    _controller.clear();
                  },
                )
              : IconButton(
                  splashRadius: 24,
                  highlightColor: Colors.grey[600].withOpacity(0.2),
                  splashColor: Colors.transparent,
                  icon: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[800],
                    ),
                    height: 40,
                    width: 40,
                    child: Icon(
                      Icons.mic_none,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: Duration(milliseconds: 50),
                        type: PageTransitionType.fade,
                        child: SpeerchToText(),
                      ),
                    );
                  },
                )
        ],
      ),
      body: ListView.builder(
        reverse: true,
        shrinkWrap: true,
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return InkWell(
            key: Key(titles[index]),
            child: ListTile(
              leading: Icon(Icons.history, color: Colors.white, size: 21.5),
              title: Text(
                titles[index],
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(
                Custom_Icons.mynorthwest_24px,
                color: Colors.white,
                size: 14,
              ),
            ),
            onTap: () {
              setState(() {
                _controller.text = titles[index].toString();
              });
            },
            onLongPress: () {
              setState(() {
                showDialog<void>(
                  barrierColor: Colors.black26,
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.grey.shade900,
                      title: Text(
                        titles[index],
                        style: TextStyle(color: Colors.white),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      content: Text(
                        'Удалить из истории \n поиска?',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'отмена',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              titles.removeAt(index);
                              Navigator.pop(context);
                            });
                          },
                          child: const Text(
                            'удалить',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    );
                  },
                );
              });
            },
          );
        },
      ),
    );
  }
}
