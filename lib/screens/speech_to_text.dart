import 'package:flutter/material.dart';

class SpeerchToText extends StatefulWidget {
  @override
  _SpeerchToTextState createState() => _SpeerchToTextState();
}

class _SpeerchToTextState extends State<SpeerchToText> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: IconButton(
                splashRadius: 25,
                highlightColor: Colors.grey[600].withOpacity(0.2),
                splashColor: Colors.transparent,
                icon: Icon(
                  Icons.clear,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                width: 120,
                child: Text(
                  'Говорите...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
            Center(
              child: Container(
                width: 480,
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: FloatingActionButton(
                    backgroundColor: Colors.red,
                    autofocus: true,
                    onPressed: () {},
                    child: Icon(
                      Icons.mic,
                      size: 55,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
