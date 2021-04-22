import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:posees/models/user.dart';
import 'package:posees/pages/Squat.dart';
import 'package:posees/pages/shoulder_press.dart';
import 'package:posees/pages/cool_down.dart';
import 'sample_videos.dart';
import 'videos_home_page.dart';
import 'start_workout_page.dart';

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Lets Begin'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final AppUser user;
  MyHomePage({Key key, this.title, this.user}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  File _image;
  ImagePicker imagePicker;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = ImagePicker();
  }

  void chooseImage() async {
    PickedFile pickedFile =
        await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  void takePicture() async {
    PickedFile pickedFile =
        await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Lets Begin"),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VideoHomePage()));
                  },
                  shape: CircleBorder(),
                  color: Color(0xFF009688).withOpacity(0.8),
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      Icon(
                        Icons.accessibility_new_rounded,
                        size: 120,
                        color: Colors.black,
                      ),
                      Text("Guide")
                    ],
                  ),
                ),
                Text("  "),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => startWorkout()));
                  },
                  shape: CircleBorder(),
                  color: Color(0xFF009688).withOpacity(0.8),
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      Icon(Icons.accessibility_new_rounded, size: 120),
                      Text("Work Out!")
                    ],
                  ),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/images/pic32.jpg"),
                  fit: BoxFit.cover)),
        ),
      );
}
