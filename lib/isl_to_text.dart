import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
//import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

class ISLToTextScreen extends StatefulWidget {
  const ISLToTextScreen({Key? key}) : super(key: key);

  @override
  _ISLToTextScreenState createState() => _ISLToTextScreenState();
}

class _ISLToTextScreenState extends State<ISLToTextScreen> {
  late CameraController _cameraController;
  late Interpreter _interpreter;
  late List<String> _labels;
  String _outputText = "Recognizing...";

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _loadModel();
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
      _outputText = _labels[output.toInt()];
    });
  }

  Future<List<List<int>>> _processImageForModel(XFile image) async {
    // Add image processing logic to match your model's requirements
    // Resize, normalize, etc.
    return List.generate(1, (i) => List.generate(1, (j) => 0)); // Placeholder
  }

  @override
  Widget build(BuildContext context) {
    if (!_cameraController.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('ISL to Text'),
      ),
      body: Column(
        children: [
          CameraPreview(_cameraController),
          Text(_outputText),
          ElevatedButton(
            onPressed: _processImage,
            child: const Text('Capture & Recognize'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _interpreter.close();
    super.dispose();
  }
}
