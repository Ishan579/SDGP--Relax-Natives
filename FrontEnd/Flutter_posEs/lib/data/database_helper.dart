import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:posees/models/user.dart';

import '../models/user.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database _db;
  final String tableUser = "User";
  final String columnName = "name";
  final String columnUserName = "username";
  final String columnPassword = "password";
  final String columnWeight = "weight";
  final String columnGender = "gender";
  final String columnAge = "age";

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }

    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "main.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE User(id INTEGER PRIMARY KEY, name TEXT, username TEXT, password TEXT, weight TEXT, gender TEXT, age TEXT, flaglogged TEXT)");
    print("Table is created");
  }

//insertion
  Future<int> saveUser(AppUser user) async {
    var dbClient = await db;
    int res = await dbClient.insert("User", user.toMap());
    List<Map> list = await dbClient.rawQuery('SELECT * FROM User');
    print(list);
    return res;
  }

  Future<AppUser> selectUser(AppUser user) async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(tableUser,
        columns: [
          columnUserName,
          columnPassword,
          columnName,
          columnGender,
          columnWeight,
          columnAge
        ],
        where: "$columnUserName = ? and $columnPassword = ?",
        whereArgs: [user.username, user.password]);
    print(maps);
    if (maps.length > 0) {
      var rUser = new AppUser.name(
          maps[0]['name'],
          maps[0]['username'],
          maps[0]['password'],
          maps[0]['weight'],
          maps[0]['gender'],
          maps[0]['age'],
          "logged");
      return rUser;
    } else {
      return null;
    }
  }

  //deletion
  Future<int> deleteUser(AppUser user) async {
    var dbClient = await db;
    int res = await dbClient.delete("User");
    return res;
  }
}
