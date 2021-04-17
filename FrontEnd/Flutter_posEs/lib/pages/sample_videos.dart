import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sampleVideosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sample Workout videos")),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/images/pic4.jpg"), fit: BoxFit.cover)),
      ),
    );
  }
}
