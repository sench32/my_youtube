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
            IconButton(
              splashRadius: 25,
              highlightColor: Colors.grey[600].withOpacity(0.2),
              splashColor: Colors.transparent,
              icon: Icon(
                Icons.clear,
                size: 32,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              'Говорите...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
