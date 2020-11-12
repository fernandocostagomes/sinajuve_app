import 'dart:convert' as convert;
import 'package:sinajuve_app/ui/utils/prefs.dart';

class Usuario {
  String token;
  String userEmail;
  String userNicename;
  String userDisplayName;

  Usuario({this.token, this.userEmail, this.userNicename, this.userDisplayName});

  Usuario.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userEmail = json['user_email'];
    userNicename = json['user_nicename'];
    userDisplayName = json['user_display_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['user_email'] = this.userEmail;
    data['user_nicename'] = this.userNicename;
    data['user_display_name'] = this.userDisplayName;
    return data;
  }

  @override
  String toString() {
    return 'User{token: $token, user_email: $userEmail, user_nicname: $userNicename, user_display_name: $userNicename}';
  }

  static void clear() {
    Prefs.setString("user.prefs", "");
  }

  void save() {
    Map map = toJson();

    String json = convert.json.encode(map);

    Prefs.setString("user.prefs", json);
  }

  static Future<Usuario> get() async {
    String json = await Prefs.getString("user.prefs");
    if (json.isEmpty) {
      return null;
    }
    Map map = convert.json.decode(json);
    Usuario usuario = Usuario.fromJson(map);
    return usuario;
  }
}
