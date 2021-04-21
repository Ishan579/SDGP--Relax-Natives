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
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => stretchPage()));
                },
                shape: CircleBorder(),
                color: Color(0xFF009688).withOpacity(0.8),
                padding: EdgeInsets.all(20.0),
                textColor: Colors.white,
                child: Column(
                  // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Icon(Icons.accessibility_new_rounded, size: 40),
                    Text("Stretch"),
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => squatPage()));
                },
                shape: CircleBorder(),
                color: Color(0xFF009688).withOpacity(0.8),
                padding: EdgeInsets.all(20.0),
                textColor: Colors.white,
                child: Column(
                  // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Icon(Icons.accessibility_new_rounded, size: 40),
                    Text("Squats"),
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => crunchesPage()));
                },
                shape: CircleBorder(),
                color: Color(0xFF009688).withOpacity(0.8),
                padding: EdgeInsets.all(20.0),
                textColor: Colors.white,
                child: Column(
                  // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Icon(Icons.accessibility_new_rounded, size: 40),
                    Text("Shoulder press"),
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => burpeesPage()));
                },
                shape: CircleBorder(),
                color: Color(0xFF009688).withOpacity(0.8),
                padding: EdgeInsets.all(20.0),
                textColor: Colors.white,
                child: Column(
                  // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Icon(Icons.accessibility_new_rounded, size: 40),
                    Text("Burpees"),
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => lungesPage()));
                },
                shape: CircleBorder(),
                color: Color(0xFF009688).withOpacity(0.8),
                padding: EdgeInsets.all(20.0),
                textColor: Colors.white,
                child: Column(
                  // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Icon(Icons.accessibility_new_rounded, size: 40),
                    Text("Lunges"),
                  ],
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/images/pic33.jpeg"), fit: BoxFit.cover)),
      ),
    );
  }
}
