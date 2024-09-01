import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class AudioToISLScreen extends StatefulWidget {
  const AudioToISLScreen({Key? key}) : super(key: key);

  @override
  _AudioToISLScreenState createState() => _AudioToISLScreenState();
}

class _AudioToISLScreenState extends State<AudioToISLScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = "Say something...";

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize();
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(onResult: (val) => setState(() {
          _text = val.recognizedWords;
        }));
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio to ISL'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _listen,
              child: _isListening ? const Text('Listening...') : const Text('Start Listening'),
            ),
            const SizedBox(height: 20),
            Text(
              _text,
              style: const TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 20),
            if (_text.isNotEmpty && !_isListening)
              Expanded(
                child: ListView.builder(
                  itemCount: _text.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      'assets/isl_gestures/${_text[index].toUpperCase()}.png',
                      height: 100,
                      width: 100,
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
