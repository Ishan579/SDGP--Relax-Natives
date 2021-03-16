import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/database_data/api-data.dart';
import 'package:flutter_app/models/user.dart';

import 'home.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageStatus {
  BuildContext _ctx;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  String _email, _password;

  LoginPageHandler _pageHanlder;

  _LoginPageState() {
    _pageHanlder = new LoginPageHandler(this);
  }

  //----UI Start----//
  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var loginBtn = new ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0)),
        backgroundColor: MaterialStateProperty.all(Colors.green),
      ),
      onPressed: _submitLogin,
      child: new Text("Login"),
    );
    var registerBtn = new ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(26.0, 10.0, 26.0, 10.0)),
        backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
      ),
      onPressed: _register,
      child: new Text("Register"),
    );
    var loginForm = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(20.0),
                child: new TextFormField(
                  onSaved: (val) => _email = val,
                  decoration: new InputDecoration(labelText: "Username"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(20.0),
                child: new TextFormField(
                  obscureText: true,
                  onSaved: (val) => _password = val,
                  decoration: new InputDecoration(labelText: "Password"),
                ),
              )
            ],
          ),
        ),
        new Padding(
            padding: const EdgeInsets.all(10.0),
            child: loginBtn),
        registerBtn
      ],
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
      ),
      key: scaffoldKey,
      body: new SingleChildScrollView(
        child: new Container(
          child: new Center(
            child: loginForm,
          ),
        ),
      ),
    );
  }
  //----UI End----//

  @override
  void onLoginError(String error) {
    _showSnackBar("Login not successful");
  }

  @override
  void onLoginSuccess(User user) async {
    if(user.flaglogged == "logged"){
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(user: user,),
          ));
      // Navigator.of(context).pushNamed("/home");
    }else{
      _showSnackBar("Invalid Username or Password");
    }
  }

  void _register() {
    Navigator.of(context).pushNamed("/register");
  }

  void _submitLogin() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        form.save();
        _pageHanlder.doLogin(_email, _password);
      });
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

}

abstract class LoginPageStatus{
  void onLoginSuccess(User user);
  void onLoginError(String error);
}

class LoginPageHandler {
  LoginPageStatus _view;
  RestData api = new RestData();
  LoginPageHandler(this._view);

  doLogin(String username, String password){
    api.login(username, password).then((user) => _view.onLoginSuccess(user))
        .catchError((onError) => _view.onLoginError(onError));
  }
}
