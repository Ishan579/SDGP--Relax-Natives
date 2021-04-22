import 'package:posees/models/user.dart';
import 'package:posees/utils/network_util.dart';
import 'package:posees/utils/network_util.dart';
import 'database_helper.dart';
import 'dart:async';
import '../models/user.dart';

class RestData {
  Future<AppUser> login(String username, String password) async {
    var user = new AppUser.name(null, username, password, null, null, null, null);
    var db = new DatabaseHelper();
    var userRetorno = new AppUser();
    userRetorno = await db.selectUser(user);
    if (userRetorno != null) {
      return new Future.value(userRetorno);
    } else {
      return new Future.value(new AppUser());
    }
  }
}
