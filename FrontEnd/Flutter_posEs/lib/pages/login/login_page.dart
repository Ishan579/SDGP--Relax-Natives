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

bool _secureText = true;

class _LoginPageState extends State<LoginPage> implements LoginPageContract {
  BuildContext _ctx;
  bool _isLoading = false;
  final formkey = new GlobalKey<FormState>();
  final ScaffoldKey = new GlobalKey<ScaffoldState>();

  String _username, _password;

  LoginPagePresenter _presenter;

  _LoginPageState() {
    _presenter = new LoginPagePresenter(this);
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
            builder: (context) => MyHomePage(
              user: user,
            ),
          ));
      Navigator.of(context).pushNamed("/home");
    } else {
      _showSnackBar("Invalid Username or Password");
    }
  }

  void _submit() {
    final form = formkey.currentState;
    //Navigator.of(context).pushNamed("/home");

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

    var loginBtn = new ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0)),
        backgroundColor: MaterialStateProperty.all(Colors.green[750]),
      ),
      onPressed: _submit,
      child: new Text("Login"),
    );

    var register = new ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            EdgeInsets.fromLTRB(26.0, 10.0, 26.0, 10.0)),
        backgroundColor: MaterialStateProperty.all(Colors.green[750]),
      ),
      onPressed: _register,
      child: new Text("Register"),
    );
    var loginform = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.all(45),
          child: Text(
            'Exer Vision',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.greenAccent,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black,
                  offset: Offset(3.0, 3.0),
                ),
              ],
            ),
          ),
        ),
        new Form(
            key: formkey,
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new TextFormField(
                    onSaved: (val) => _username = val,
                    decoration: new InputDecoration(
                        hintText: "User Name",
                        labelText: "Username",
                        labelStyle:
                            TextStyle(fontSize: 17, color: Colors.white),
                        border: OutlineInputBorder()),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new TextFormField(
                    onSaved: (val) => _password = val,
                    decoration: new InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                        labelStyle:
                            TextStyle(fontSize: 17, color: Colors.white),
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(_secureText
                              ? Icons.remove_red_eye
                              : Icons.security),
                          onPressed: () {
                            setState(() {
                              _secureText = !_secureText;
                            });
                          },
                        )),
                    obscureText: _secureText,
                  ),
                )
              ],
            )),
        new Padding(padding: const EdgeInsets.all(10.0), child: loginBtn),
        register,
      ],
    );
    return new Scaffold(
      key: ScaffoldKey,
      body: new Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/images/pic9.png"), fit: BoxFit.cover)),
        child: new Center(
          child: loginform,
        ),
      ),
    );
  }
}

/*abstract class LoginPageStatus {
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
}*/
