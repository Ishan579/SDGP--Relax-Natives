import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:posees/pages/shoulder_press.dart';
import 'package:posees/pages/Squat.dart';
import 'package:posees/pages/cool_down.dart';

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
        appBar: AppBar(
        title: Text('Start Workout'),
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("lib/images/pic1.jpg"), fit: BoxFit.cover)),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
          // _image != null
          //    ? Image.file(_image)
          //   : Icon(Icons.image, size: 100),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.teal,
                onPrimary: Colors.white,
                onSurface: Colors.grey,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                textStyle:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CoolDown(
                    cameras: cameras,
                    title: 'Warrier ',
                  ),
                ),
              );
            },
            child: Text("Train Warrier Pose Now"),
          ),

          //home: MainScreen(cameras),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.teal,
                onPrimary: Colors.white,
                onSurface: Colors.grey,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                textStyle:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShoulderPress(
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
                primary: Colors.teal,
                onPrimary: Colors.white,
                onSurface: Colors.grey,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                textStyle:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Squat(
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
