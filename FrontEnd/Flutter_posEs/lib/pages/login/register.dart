import 'package:flutter/material.dart';
//import 'package:flutter_app/database_data/db-helper.dart';
//import 'package:FLUTTER_POSES/data/database_helper.dart';

import 'package:posees/models/user.dart';
//import '../../data/database_helper.dart';
import 'package:posees/data/database_helper.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  BuildContext _ctx;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _name, _username, _password, _weight, _age;
  String _gender = 'male';

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var registerBtn = new ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            EdgeInsets.fromLTRB(26.0, 10.0, 26.0, 10.0)),
        backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
      ),
      onPressed: _submit,
      child: new Text("Register"),
    );

    var registerForm = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 1.0, 30.0, 1.0),
                child: new TextFormField(
                  onSaved: (val) => _name = val,
                  decoration: new InputDecoration(labelText: "Name"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
              ),
              new Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 1.0, 30.0, 1.0),
                child: new TextFormField(
                  onSaved: (val) => _username = val,
                  decoration: new InputDecoration(labelText: "Username"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Username is required';
                    }
                    return null;
                  },
                ),
              ),
              new Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 1.0, 30.0, 1.0),
                child: new TextFormField(
                  obscureText: true,
                  onSaved: (val) => _password = val,
                  decoration: new InputDecoration(labelText: "Password"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                ),
              ),
              new Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 1.0, 30.0, 1.0),
                child: new TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (val) => _weight = val,
                  decoration: new InputDecoration(labelText: "Weight"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your weight';
                    } else if (int.parse(value) >= 150 ||
                        int.parse(value) < 20) {
                      return 'Your weight should be between 20 - 150';
                    }
                    return null;
                  },
                ),
              ),
              new Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 1.0),
                child: new Column(
                  children: <Widget>[
                    new Text("Gender"),
                    new RadioListTile(
                      groupValue: _gender,
                      title: Text('Male'),
                      value: 'male',
                      onChanged: (val) {
                        setState(() {
                          _gender = val;
                        });
                      },
                    ),
                    new RadioListTile(
                      groupValue: _gender,
                      title: Text('Female'),
                      value: 'female',
                      onChanged: (val) {
                        setState(() {
                          _gender = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
              new Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 1.0, 30.0, 30.0),
                child: new TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (val) => _age = val,
                  decoration: new InputDecoration(labelText: "Age"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your age';
                    } else if (int.parse(value) >= 60 ||
                        int.parse(value) < 18) {
                      return 'Your age should be between 18 - 60';
                    }
                    return null;
                  },
                ),
              )
            ],
          ),
        ),
        new Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 1.0, 30.0, 30.0),
          child: registerBtn,
        )
      ],
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Register"),
      ),
      key: scaffoldKey,
      body: new SingleChildScrollView(
        child: new Container(
          child: new Center(
            child: registerForm,
          ),
        ),
      ),
    );
  }

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      setState(() {
        form.save();
        var user = new User.name(
            _name, _username, _password, _weight, _gender, _age, null);
        var db = new DatabaseHelper();
        db.saveUser(user);
        scaffoldKey.currentState.showSnackBar(new SnackBar(
          content: new Text("Registration Success. Please login to system"),
        ));
        Future.delayed(const Duration(milliseconds: 1000), () {
          setState(() {
            Navigator.of(context).pushNamed("/login");
          });
        });
      });
    }
  }
}
