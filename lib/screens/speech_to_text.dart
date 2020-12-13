import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:avatar_glow/avatar_glow.dart';

class SpeechToText extends StatefulWidget {
  @override
  _SpeechToTextState createState() => _SpeechToTextState();
}

class _SpeechToTextState extends State<SpeechToText> {
  stt.SpeechToText _speech;
  bool _isListening = false;
  bool _tRtext = false;
  String _text, text1;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _listen();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
          animate: _isListening,
          glowColor: Colors.grey,
          endRadius: 80,
          duration: const Duration(milliseconds: 2000),
          repeatPauseDuration: const Duration(milliseconds: 100),
          repeat: true,
          child: _isListening
              ? FloatingActionButton(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.mic),
                  onPressed: _listen,
                )
              : FloatingActionButton(
                  backgroundColor: Colors.grey[800],
                  child: Icon(Icons.mic_none),
                  onPressed: _listen,
                ),
        ),
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
            Spacer(
              flex: 1,
            ),
            SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(25, 30, 15, 80),
              child: Text(
                _text,
                // _isListening ? _text : _text = 'Повторите пыпытку',
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Spacer(
              flex: 12,
            ),
            SizedBox(),
            Center(
              child: Text(
                _isListening
                    ? text1 = ''
                    : text1 = 'Нажмите на значок микрофона',
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            // SizedBox(),
          ],
        ),
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _text = 'Говорите...';
        print('test!');
        _speech.listen(
          cancelOnError: true,
          onDevice: true,
          onResult: (val) => setState(
            () {
              _text = val.recognizedWords;
              _tRtext = true;
            },
          ),
        );
      }
    } else {
      setState(() => _isListening = false);
      if (!_tRtext) {
        _text = 'Повторите пыпытку';
      } else {
        Navigator.pop(context);
      }
      _speech.stop();
    }
  }
}
