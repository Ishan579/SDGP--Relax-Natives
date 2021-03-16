import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/play_page.dart';
import 'package:http/http.dart' as http;

import 'models/clips.dart';
import 'models/user.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  BuildContext _ctx;
  final User user;
  HomePage({Key key, @required this.user}) : super(key: key);

  //----UI Start----//
  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var menuBtn = new RaisedButton(
      padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
      onPressed: _navigateVideos,
      child: new Text("Menu"),
      color: Colors.blue,
    );

    var btn1 = new RaisedButton(
      padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
      onPressed: _btnPressed,
      child: new Text("Btn 1"),
      color: Colors.green,
    );

    var btn2 = new RaisedButton(
      padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
      onPressed: _btnPressed,
      child: new Text("Btn 2"),
      color: Colors.green,
    );

    var welcomeTxt = new Padding(
      padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 70.0),
      child: new Text("Welcome ${user.name}",),
    );

    return new Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: new Container(
          child: new Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[welcomeTxt, menuBtn, btn1, btn2],
            ),
          ),
        ),
      );
    }
  //----UI End----//

    void _btnPressed(){
    }

    void _navigateVideos() {
      int age = int.parse(user.age);
      int weight = int.parse(user.weight);
      if(age >= 18 && age <= 28){
        Navigator.push(_ctx, CupertinoPageRoute(builder: (context) => PlayPage(clips: VideoClip.Clips18_28)),);
        if(weight >= 30 && weight <= 60){


        }else if(weight >= 60 && weight <= 80){


        }

      }else if(age >= 28 && age <= 48){
        Navigator.push(_ctx, CupertinoPageRoute(builder: (context) => PlayPage(clips: VideoClip.Clips28_48)),);





      }else if(age >= 48 && age <= 58){
          Navigator.push(_ctx, CupertinoPageRoute(builder: (context) => PlayPage(clips: VideoClip.Clips48_58)),);


        }

      }

  }







