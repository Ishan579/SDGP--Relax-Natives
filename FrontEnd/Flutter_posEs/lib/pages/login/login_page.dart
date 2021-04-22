import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:posees/models/user.dart';
// import 'package:posees/pages/login/login_presenter.dart';
import '../../data/database_helper.dart';
import '../home_page.dart';
import '../home_page.dart';
import 'package:posees/data/rest_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

bool _secureText = true;

class _LoginPageState extends State<LoginPage> implements LoginPageStatus {
  BuildContext _ctx;
  bool _isLoading = false;
  final formkey = new GlobalKey<FormState>();
  final ScaffoldKey = new GlobalKey<ScaffoldState>();

  String _username, _password;

  LoginPageHandler _presenter;

  _LoginPageState() {
    _presenter = new LoginPageHandler(this);
  }

  @override
  void onLoginError(String error) {
    // TODO: implement onLoginError
    _showSnackBar(error);
  }

  @override
  void onLoginSuccess(AppUser user) async {
    // TODO: implement onLoginSuccess
    if (user.flaglogged == "logged") {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(
              user: user,
            ),
          ));
    } else {
      _showSnackBar("Error");
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

abstract class LoginPageStatus {
  void onLoginSuccess(AppUser user);
  void onLoginError(String error);
}

class LoginPageHandler {
  LoginPageStatus _view;
  RestData api = new RestData();
  LoginPageHandler(this._view);

  //login method
  doLogin(String useremail, String password) async {

    try {
      //create firebase auth instance
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: useremail,
          password: password
      );
      //check user status
      if (userCredential != null) {
        //Create realtime database referance
        final databaseRef = FirebaseDatabase.instance.reference();
        //read firebase realtime data
        databaseRef.child('users').orderByChild("email").equalTo(useremail).once().then((DataSnapshot snapshot) {
          print('Data : ${snapshot.value}');
          //Map data snapshot
          Map <dynamic, dynamic> values = snapshot.value;
          values.forEach((key, values) {
            var name = values["name"].toString();
            var email = values["email"].toString();
            var gender = values["gender"].toString();
            var age = values["age"].toString();
            var weight = values["weight"].toString();
            //Create user object
            AppUser user = AppUser.name(name, email, null, weight, gender, age, "logged");
            _view.onLoginSuccess(user);
          });
        });
      }
      //  Handle auth exceptions
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        _view.onLoginError('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        _view.onLoginError('Wrong password provided for that user.');
      }
    }
  }
}
