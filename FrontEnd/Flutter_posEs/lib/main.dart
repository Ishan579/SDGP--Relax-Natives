import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:posees/pages/home_page.dart';
import 'package:posees/pages/login/login_page.dart';
import 'package:posees/pages/login/register.dart';


//------Main method---------
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
//--------Routings-----------
final routes = {
  '/login': (BuildContext context) => new LoginPage(),
  '/home': (BuildContext context) => new HomePage(),
  '/register': (BuildContext context) => new RegisterPage(),
  '/': (BuildContext context) => new LoginPage(),
};

class MyApp extends StatelessWidget {

  //----UI Start----//
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'ExerVision',
      theme: new ThemeData(primarySwatch: Colors.teal),
      routes: routes,
    );
  }
//----UI End----//
}
