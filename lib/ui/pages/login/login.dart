import 'dart:convert' as convert;
import 'package:sinajuve_app/ui/utils/prefs.dart';

class Login {
  String login;
  String password;

  Login({this.login, this.password});

  Login.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['password'] = this.password;
    return data;
  }

  @override
  String toString() {
    return 'Login{login: $login, password: $password}';
  }

  static void clear() {
    Prefs.setString("login.prefs", "");
  }

  void save() {
    Map map = toJson();

    String json = convert.json.encode(map);

    Prefs.setString("login.prefs", json);
  }

  static Future<Login> get() async {
    String json = await Prefs.getString("login.prefs");
    if (json.isEmpty) {
      return null;
    }
    Map map = convert.json.decode(json);
    Login login = Login.fromJson(map);
    return login;
  }
}
