import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
      ),
      body: new Center(
        child: new Text("Home Page"),
      ),
      
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}