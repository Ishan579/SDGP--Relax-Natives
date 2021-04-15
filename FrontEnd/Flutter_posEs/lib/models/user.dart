class User {
  String _username;
  String _password;

  User(this._username, this._password);

  User.map(dynamic obj) {
    this._username = obj['username'];
    this._password = obj['password'];
  }

  User.name(String name, String username, String password, String weight, String gender, String age, param6);
  String get username => _username;
  String get password => _password;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = _username;
    map["password"] = _password;
    return map;
  }
}
