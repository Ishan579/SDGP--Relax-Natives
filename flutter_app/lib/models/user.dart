class User {
  String _name;
  String _username;
  String _password;
  String _weight;
  String _gender;
  String _age;
  String _flaglogged;


  User();

  User.name(this._name, this._username, this._password, this._weight, this._gender, this._age, this._flaglogged);

  User.map(dynamic obj) {
    this._name = obj['name'];
    this._username = obj['username'];
    this._password = obj['password'];
    this._weight = obj['weight'];
    this._gender = obj['gender'];
    this._age = obj['age'];
    this._flaglogged = obj['password'];
  }

  String get name => _name;
  String get username => _username;
  String get password => _password;
  String get weight => _weight;
  String get gender => _gender;
  String get age => _age;
  String get flaglogged => _flaglogged;

  set flaglogged(String value) {
    _flaglogged = value;
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = _name;
    map["username"] = _username;
    map["password"] = _password;
    map["weight"] = _weight;
    map["gender"] = _gender;
    map["age"] = _age;
    map["flaglogged"] = _flaglogged;
    return map;
  }
}
