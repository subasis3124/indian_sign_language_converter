import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
//import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

class ISLToAudioScreen extends StatefulWidget {
  const ISLToAudioScreen({Key? key}) : super(key: key);

  @override
  _ISLToAudioScreenState createState() => _ISLToAudioScreenState();
}

class _ISLToAudioScreenState extends State<ISLToAudioScreen> {
  late CameraController _cameraController;
  late Interpreter _interpreter;
  late FlutterTts _flutterTts;
  late List<String> _labels;
  String _recognizedText = "Recognizing...";

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _loadModel();
    _flutterTts = FlutterTts();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    _cameraController = CameraController(cameras.first, ResolutionPreset.medium);
    await _cameraController.initialize();
    setState(() {});
  }

  Future<void> _loadModel() async {
    _interpreter = await Interpreter.fromAsset('isl_model.tflite');
    _labels = await _loadLabels('assets/labels.txt');
  }

  Future<List<String>> _loadLabels(String path) async {
    final file = await DefaultAssetBundle.of(context).loadString(path);
    return file.split('\n');
  }

  void _processImage() async {
    if (!_cameraController.value.isInitialized) {
      return;
    }

    final image = await _cameraController.takePicture();
    final imgInput = await _processImageForModel(image);

    _interpreter.run(imgInput, imgInput);

    final output = imgInput[0][0];
    setState(() {
      _recognizedText = _labels[output.toInt()];
    });

    _speak(_recognizedText);
  }

  Future<List<List<int>>> _processImageForModel(XFile image) async {
    // Add image processing logic to match your model's requirements
    // Resize, normalize, etc.
    return List.generate(1, (i) => List.generate(1, (j) => 0)); // Placeholder
  }

  Future<void> _speak(String text) async {
    await _flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    if (!_cameraController.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('ISL to Audio'),
      ),
      body: Column(
        children: [
          CameraPreview(_cameraController),
          Text(_recognizedText),
          ElevatedButton(
            onPressed: _processImage,
            child: const Text('Capture & Speak'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _interpreter.close();
    _flutterTts.stop();
    super.dispose();
  }
}
