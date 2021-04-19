import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'dart:math';

//import 'package:align_ai/services/extract_keypoints.dart';
//import 'package:align_ai/services/render_data.dart';
//import 'package:align_ai/services/render_data_yoga.dart';
//import 'package:align_ai/services/render_data_arm_press.dart';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:posees/pages/services/extract_keypoints.dart';
import 'package:posees/pages/services/render_shoulder_press.dart';
import 'package:tflite/tflite.dart';
import 'dart:math';

class PushedPageA extends StatefulWidget {
  final List<CameraDescription> cameras;
  final String title;
  const PushedPageA({this.cameras, this.title});
  @override
  _PushedPageAState createState() => _PushedPageAState();
}

class _PushedPageAState extends State<PushedPageA> {
  List<dynamic> _data;
  int _imageHeight = 0;
  int _imageWidth = 0;
  int x = 1;

  @override
  void initState() {
    super.initState();
    var res = loadModel();
    print('Model Response: ' + res.toString());
  }

  _setRecognitions(data, imageHeight, imageWidth) {
    if (!mounted) {
      return;
    }
    setState(() {
      _data = data;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  loadModel() async {
    return await Tflite.loadModel(
        model: "assets/posenet_mv1_075_float_from_checkpoints.tflite");
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('AlignAI Arm Press'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          ExtractKeypoints(
            cameras: widget.cameras,
            setRecognitions: _setRecognitions,
          ),
          RenderShoulderPress(
            xyPointsArray: _data == null ? [] : _data,
            imageHeight: max(_imageHeight, _imageWidth),
            imageWidth: min(_imageHeight, _imageWidth),
            screenHeight: screen.height,
            screenWidth: screen.width,
          ),
        ],
      ),
    );
  }
}
