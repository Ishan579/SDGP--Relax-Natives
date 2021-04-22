import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'dart:math' as math;
//takes x y cordinates and sets on the data list
// a pointer to a function similar to the specified format
typedef void Callback(List<dynamic> list, int h, int w);

class  ExtractKeypoints extends StatefulWidget {

  //A list holding cameras
  final List<CameraDescription> cameras;
  final Callback setRecognitions;//data list , height and width integers
//intitialize this class with a list of cameras and set recognitions that has a data list with x and y cordinates ,and intger height and width
  ExtractKeypoints({this.cameras, this.setRecognitions});

  @override
  _ExtractKeypointsState createState() => new _ExtractKeypointsState();
}

class _ExtractKeypointsState extends State<ExtractKeypoints> {
  //Camera Controller from Dart Camera Class
  CameraController controller;
  //Says no image is not detected
  bool isDetecting = false;

  @override
  void initState() {
    super.initState();
//widget = flutter keyword
    if (widget.cameras == null || widget.cameras.length < 1) {
      print('No camera is found');
    } else {
      controller = new CameraController(
        //cameras[1] means front camera
        widget.cameras[1],
        ResolutionPreset.high,
      );
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
//taking live feed from the camera
        controller.startImageStream((CameraImage img) {
          if (!isDetecting) {
            isDetecting = true;

            int startTime = new DateTime.now().millisecondsSinceEpoch;
//runs PoseNet on the live feed
            Tflite.runPoseNetOnFrame(
              bytesList: img.planes.map((plane) {
                return plane.bytes;
              }).toList(),
              imageHeight: img.height,
              imageWidth: img.width,
              //numResults: 2,
              numResults: 1,
              rotation: -90,
              threshold: 0.1,
              nmsRadius: 10,

            ).then((recognitions) {
              int endTime = new DateTime.now().millisecondsSinceEpoch;
              print("Detection time : ${endTime - startTime}");
              //    print(recognitions);
              //sets recognitions with a list of x and y cordinates taken from the runPoseNetOnFrame
              widget.setRecognitions(recognitions, img.height, img.width);

              isDetecting = false;
            });
          }
        });
      });
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller.value.isInitialized) {
      return Container();
    }
    //takes the height and width of the screen and saves into tmp
    var tmp = MediaQuery.of(context).size;
    //takes the maximum between tmp height and width of the screen and saves it as the screenH
    var screenH = math.max(tmp.height, tmp.width);
    //takes the minimum between tmp height and width of the screen and saves it as the screenW
    var screenW = math.min(tmp.height, tmp.width);
    //takes the height and width of the camera image input
    tmp = controller.value.previewSize;
    //saves height of the camera as the maximum value between the camera input height and width
    var previewH = math.max(tmp.height, tmp.width);
    var previewW = math.min(tmp.height, tmp.width);
    //screen ratio
    var screenRatio = screenH / screenW;
    //preview ratio
    var previewRatio = previewH / previewW;

    return OverflowBox(
      //displaying the camera preview
      maxHeight:
      screenRatio > previewRatio ? screenH : screenW / previewW * previewH,
      maxWidth:
      screenRatio > previewRatio ? screenH / previewH * previewW : screenW,
      child: CameraPreview(controller),
    );
  }
}
