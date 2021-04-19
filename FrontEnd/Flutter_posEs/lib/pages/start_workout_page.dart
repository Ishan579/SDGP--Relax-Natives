import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:posees/pages/pushed_pageA.dart';
import 'package:posees/pages/pushed_pageS.dart';
import 'package:posees/pages/pushed_pageY.dart';

//Takes a list of cameras in the device: front[0] back camera[1]
List<CameraDescription> cameras;

class startWorkout extends StatelessWidget {
  Future<Null> loadcams() async {
    WidgetsFlutterBinding.ensureInitialized();
    try {
      //a function from the camera package , extracts available cams and saves
      //them in to the previous camera
      cameras = await availableCameras();
    } on CameraException catch (e) {
      //some esxpetion related to the camera
      print('Error: $e.code\nError Message: $e.message');
    }
  }

  @override
  //Displays into the screen
  Widget build(BuildContext context) {
    loadcams();
    return Scaffold(
        body: Container(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
          // _image != null
          //    ? Image.file(_image)
          //   : Icon(Icons.image, size: 100),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                textStyle:
                    TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PushedPageY(
                    cameras: cameras,
                    title: 'Warrier ',
                  ),
                ),
              );
            },
            child: Text("Train Pose Now"),
          ),

          //home: MainScreen(cameras),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                textStyle:
                    TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PushedPageA(
                    cameras: cameras,
                    title: 'Arm Press ',
                  ),
                ),
              );
            },
            child: Text("Train Arm Press Now"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                textStyle:
                    TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PushedPageS(
                    cameras: cameras,
                    title: 'squat ',
                  ),
                ),
              );
            },
            child: Text("Train Squat Now"),
          ),
        ]))));
  }
}
