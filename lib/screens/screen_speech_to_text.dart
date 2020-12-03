import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechScreen extends StatefulWidget {
  SpeechScreen({Key key}) : super(key: key);

  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  stt.SpeechToText _speech;
  bool _isListening = false;
  // ignore: unused_field
  String _text = '';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    listen();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
          animate: _isListening,
          glowColor: Colors.grey,
          endRadius: 80,
          duration: Duration(milliseconds: 2000),
          repeatPauseDuration: Duration(milliseconds: 100),
          repeat: true,
          child: _isListening
              ? FloatingActionButton(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.mic),
                  onPressed: listen,
                )
              : FloatingActionButton(
                  backgroundColor: Colors.grey[800],
                  child: Icon(Icons.mic_none),
                  onPressed: listen,
                ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                icon: Icon(
                  Icons.clear,
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
                _isListening
                    ? _text = 'Говорите...'
                    : _text = 'Повторите пыпытку',
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
                    ? _text = ''
                    : _text = 'Нажмите на значок микрофона',
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

  void listen([String s]) async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) {
          return (setState(() => listen()));
          // ignore: dead_code
          _speech.cancel();
        },
      );

      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
}
