import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:posees/models/user.dart';
import 'package:posees/pages/pushed_pageS.dart';
import 'package:posees/pages/pushed_pageA.dart';
import 'package:posees/pages/pushed_pageY.dart';
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
  final User user;
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
  Widget build(BuildContext context) {
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
                    primary: Colors.teal,
                    onPrimary: Colors.white,
                    onSurface: Colors.grey,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    textStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VideoHomePage()));
                },
                child: Text("Train Now"),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PushedPageY()));
                },
                child: Text("Train Warrier Pose"),
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
                    primary: Colors.teal,
                    onPrimary: Colors.white,
                    onSurface: Colors.grey,

                    elevation: 5,

                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    textStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    onPrimary: Colors.white,
                    onSurface: Colors.grey,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    textStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => startWorkout()));
                },
                child: Text("Start Workout!"),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/images/pic3.jpg"), fit: BoxFit.cover)),
      ),
    );
  }
}
