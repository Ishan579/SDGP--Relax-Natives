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
                    image: AssetImage("lib/images/pic1.jpg"),
                    fit: BoxFit.cover)),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  // _image != null
                  //    ? Image.file(_image)
                  //   : Icon(Icons.image, size: 100),

                  FlatButton(
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
                    shape: CircleBorder(),
                    color: Color(0xFF009688).withOpacity(0.8),
                    padding: EdgeInsets.all(20.0),
                    textColor: Colors.white,
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(Icons.accessibility_new_rounded, size: 40),
                        Text("Warrior")
                      ],
                    ),
                  ),
                  Text(""),
                  FlatButton(
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
                    shape: CircleBorder(),
                    color: Color(0xFF009688).withOpacity(0.8),
                    padding: EdgeInsets.all(20.0),
                    textColor: Colors.white,
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(Icons.accessibility_new_rounded, size: 40),
                        Text("Arm Press")
                      ],
                    ),
                  ),
                  Text(""),
                  FlatButton(
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
                    shape: CircleBorder(),
                    color: Color(0xFF009688).withOpacity(0.8),
                    padding: EdgeInsets.all(20.0),
                    textColor: Colors.white,
                    child: Column(
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(Icons.accessibility_new_rounded, size: 40),
                        Text("Squat"),
                      ],
                    ),
                  ),

                  //home: MainScreen(cameras),
                ]))));
  }
}
