import 'package:posees/models/user.dart';
import 'package:posees/utils/network_util.dart';
import 'package:posees/utils/network_util.dart';

class RestData {
  NetworkUtil _netUtil = new NetworkUtil();

  static final BASE_URL = '';
  static final LOGIN_URL = BASE_URL + "/";

  Future<User> login(String username, String password) {
    return null;
  }
}
