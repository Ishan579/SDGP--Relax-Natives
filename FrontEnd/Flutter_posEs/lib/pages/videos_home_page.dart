import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:video_player/video_player.dart';
import 'video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoHomePage extends StatefulWidget {
  @override
  VideoPage createState() => VideoPage();
}

class VideoPage extends State<VideoHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watch Workout Videos'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => stretchPage()));
                },
                child: Text("Stretch"),
                color: Colors.teal,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => squatPage()));
                },
                child: Text("      Squats      "),
                color: Colors.teal,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => crunchesPage()));
                },
                child: Text("Shoulder press"),
                color: Colors.teal,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => burpeesPage()));
                },
                child: Text("      Burpees     "),
                color: Colors.teal,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => lungesPage()));
                },
                child: Text("Lunges"),
                color: Colors.teal,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/images/pic1.jpg"), fit: BoxFit.cover)),
      ),
    );
  }
}
