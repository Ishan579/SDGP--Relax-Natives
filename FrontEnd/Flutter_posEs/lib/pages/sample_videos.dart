import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sampleVideosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sample Workout videos")),
      body: Center(
          child: RaisedButton(
        onPressed: () {},
        child: Text("Go Back"),
      )),
    );
  }
}
