import 'dart:convert' as convert;
import 'package:sinajuve_app/ui/utils/prefs.dart';

class Roles {
  List<String> roles;

  Roles({this.roles});

  Roles.fromJson(Map<String, dynamic> map) {
    roles = map["roles"].map<String>((role) => role.toString()).toList();
  }

  Roles.parseJson(String json){
    var listRoles = List<String>();
    if(json.contains("gerente")){
      listRoles.add("gerente");
    }
    if(json.contains("avaliador_sinajuve")){
      listRoles.add("avaliador_sinajuve");
    }
    if(json.contains("subscriber")){
      listRoles.add("subscriber");
    }
    if(json.contains("gestor") || json.contains("quase_gestor") || json.contains("futuro_gestor")){
      listRoles.add("gestor");
    }
    roles = listRoles;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["roles"] = this.roles;
    return data;
  }

  @override
  String toString() {
    return 'roles{roles: $roles}';
  }

  static void clear() {
    Prefs.setString("roles.prefs", "");
  }

  void save() {
    Map map = toJson();
    String json = convert.json.encode(map);
    Prefs.setString("roles.prefs", json);
  }

  static Future<Roles> get() async {
    String json = await Prefs.getString("roles.prefs");
    if (json.isEmpty) {
      return null;
    }
    Map map = convert.json.decode(json);
    Roles roles = Roles.fromJson(map);
    return roles;
  }
}
