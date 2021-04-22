import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:posees/pages/services/extract_keypoints.dart';
import 'package:posees/pages/services/render_shoulder_press.dart';
import 'package:tflite/tflite.dart';
import 'dart:math';

class ShoulderPress extends StatefulWidget {
  //gets a list of available cameras
  final List<CameraDescription> cameras;
  //title of the class
  final String title;
  //constructor for the ShoulderPress class
  const ShoulderPress({this.cameras, this.title});
  @override
  _ShoulderPressState createState() => _ShoulderPressState();
}

class _ShoulderPressState extends State<ShoulderPress> {
  //a list hold X and Y points
  List<dynamic> _data;
  //initializing height of the camera Feed Image
  int _imageHeight = 0;
  //initializing width of the camera Feed Image
  int _imageWidth = 0;
  int x = 1;

  @override
  void initState() {
    super.initState();
    //stores response from the posenet model
    var res = loadModel();
    //printing out the response from the mdoel
    print('Load Model Response: ' + res.toString());
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
        title: Text('Shoulder Press'),
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
