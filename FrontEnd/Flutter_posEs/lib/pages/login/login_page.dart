import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:posees/models/user.dart';
import 'package:posees/pages/login/login_presenter.dart';

import '../../data/database_helper.dart';
import '../home_page.dart';
import '../home_page.dart';
import 'package:posees/data/rest_data.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageStatus {
  BuildContext _ctx;
  bool _isLoading = false;
  final formkey = new GlobalKey<FormState>();
  final ScaffoldKey = new GlobalKey<ScaffoldState>();

  String _username, _password;

  LoginPageHandler  _presenter;

  _LoginPageState() {
    _presenter = new LoginPageHandler (this);
  }
  
  @override
  void onLoginError(String error) {
    // TODO: implement onLoginError
    _showSnackBar(error);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void onLoginSuccess(User user) async {
    // TODO: implement onLoginSuccess
    /* _showSnackBar(user.toString());
    setState(() {
      _isLoading = false;
    });
    var db = new DatabaseHelper();
    await db.saveUser(user);
   Navigator.of(context).pushNamed("/home");
  }
    }*/
    if (user.flaglogged == "logged") {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(user: user,),
          ));
       Navigator.of(context).pushNamed("/home");
    } else {
      _showSnackBar("Invalid Username or Password");
    }
  }

  void _submit() {
    final form = formkey.currentState;

    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        _presenter.doLogin(_username, _password);
      });
    }
  }

  void _register() {
    Navigator.of(context).pushNamed("/register");
  }

  void _showSnackBar(String text) {
    ScaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
   /* var loginBtn = new RaisedButton(
      // onPressed: _submit,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
      child: new Text("Login"),
      color: Colors.green,
    );*/
      var loginBtn = new ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0)),
        backgroundColor: MaterialStateProperty.all(Colors.green),
      ),
      onPressed: _submit,
      child: new Text("Login"),
    );

    var register = new ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            EdgeInsets.fromLTRB(26.0, 10.0, 26.0, 10.0)),
        backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
      ),
      onPressed: _register,
      child: new Text("Register"),
    );
    var loginform = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Text(
          "Pose Estimation Pro",
          textScaleFactor: 2.0,
        ),
        new Form(
            key: formkey,
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new TextFormField(
                    onSaved: (val) => _username = val,
                    decoration: new InputDecoration(labelText: "Username"),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new TextFormField(
                    onSaved: (val) => _password = val,
                    decoration: new InputDecoration(labelText: "Password"),
                  ),
                )
              ],
            )),
        new Padding(padding: const EdgeInsets.all(10.0), child: loginBtn),
        register,
      ],
    );
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login Page"),
      ),
      key: ScaffoldKey,
      body: new Container(
        child: new Center(
          child: loginform,
        ),
      ),
    );
  }

}

abstract class LoginPageStatus {
  void onLoginSuccess(User user);
  void onLoginError(String error);
}

class LoginPageHandler {
  LoginPageStatus _view;
  RestData api = new RestData();
  LoginPageHandler(this._view);

  doLogin(String username, String password) {
    api
        .login(username, password)
        .then((user) => _view.onLoginSuccess(user))
        .catchError((onError) => _view.onLoginError(onError));
  }
}
