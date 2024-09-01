import 'package:flutter/material.dart';

class TextToISLScreen extends StatefulWidget {
  const TextToISLScreen({Key? key}) : super(key: key);

  @override
  _TextToISLScreenState createState() => _TextToISLScreenState();
}

class _TextToISLScreenState extends State<TextToISLScreen> {
  final TextEditingController _controller = TextEditingController();
  String _selectedText = "";

  void _convertTextToISL() {
    setState(() {
      _selectedText = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text to ISL'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Text',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertTextToISL,
              child: const Text('Convert to ISL'),
            ),
            const SizedBox(height: 20),
            if (_selectedText.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: _selectedText.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      'assets/isl_gestures/${_selectedText[index].toUpperCase()}.png',
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
