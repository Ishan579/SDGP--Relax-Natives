import 'package:flutter/material.dart';
import 'package:flutter_with_python/home2.dart';
import 'package:splashscreen/splashscreen.dart';


class MySplash extends StatefulWidget {
  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: Home2(),
      title:
        Text("Dog and Cat",style:TextStyle(fontWeight:FontWeight.bold,fontSize: 30,color:Color(0xffe99600) )
        ),
      image:Image.asset('assets/catvsdog.jpeg'),
        backgroundColor:Colors.black ,
      photoSize: 50,
      loaderColor: Color(0xFFEEDA28),
    );
  }
}
