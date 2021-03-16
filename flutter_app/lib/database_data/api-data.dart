import 'dart:async';
import 'package:flutter_app/models/user.dart';
import '../models/user.dart';
import 'db-helper.dart';

class RestData {

  Future<User> login( String username, String password) async {
    var user = new User.name(null, username, password, null, null, null, null);
    var db = new DatabaseHelper();
    var userRetorno = new User();
    userRetorno = await db.selectUser(user);
    if(userRetorno != null){
      return new Future.value(userRetorno);
    }else {
      return new Future.value(new User());
    }
  }
}
