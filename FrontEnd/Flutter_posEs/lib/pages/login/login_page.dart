import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:posees/models/user.dart';
import 'package:posees/pages/login/login_presenter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageContract {
  BuildContext _ctx;
  bool _isLoading;
  final formkey = new GlobalKey<FormState>();
  final ScaffoldKey = new GlobalKey<ScaffoldState>();

  final _username, _password;

  LoginPagePresenter _presenter;

  _LoginPageState(this._username, this._password) {
    _presenter = new LoginPagePresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var loginBtn = new RaisedButton(
      onPressed: _submit,
      child: new Text("Login"),
      color: Colors.green,
    );
    var loginform = new Column(
      children: <Widget>[
        new Text("Sqflite App Login", textScaleFactor: 2.0 ,),
        
      ]
    )
  }

  @override
  void onLoginError(String error) {
    // TODO: implement onLoginError
  }

  @override
  void onLoginSuccess(User user) {
    // TODO: implement onLoginSuccess
  }
}
