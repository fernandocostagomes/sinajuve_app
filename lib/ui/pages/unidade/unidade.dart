// import 'dart:convert';
//
// import 'package:sinajuve_app/ui/utils/prefs.dart';
// import 'dart:convert' as convert;
//
// class Unidade {
//   String id;
//   String estado;
//   String cidade;
//   String nome;
//
//   Unidade({this.id, this.estado, this.cidade, this.nome});
//
//   Unidade.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     estado = json['estado'];
//     cidade = json['cidade'];
//     nome = json['nome'];
//   }
//
//   static List<Unidade> parseJson(String json){
//     var unidadesObjsJson = jsonDecode(json)['unidades'] as List;
//     List<Unidade> tagObjs = unidadesObjsJson.map((tagJson) => Unidade.fromJson(tagJson)).toList();
//     return tagObjs;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['estado'] = this.estado;
//     data['cidade'] = this.cidade;
//     data['nome'] = this.nome;
//     return data;
//   }
//
//   void save(listUnidades) {
//     Prefs.setStringList("unidades.prefs", listUnidades);
//   }
//
//   static Future<Unidade> get() async {
//     String json = await Prefs.getStringList("unidades.prefs");
//     if (json.isEmpty) {
//       return null;
//     }
//     Map map = convert.json.decode(json);
//     Unidade unidade = Unidade.fromJson(map);
//     return unidade;
//   }
//
//   static void clear() {
//     Prefs.setString("unidades.prefs", "");
//   }
// }






// To parse this JSON data, do
//
//     final unidade = unidadeFromJson(jsonString);

import 'dart:convert';
import 'dart:convert' as convert;
import 'package:sinajuve_app/ui/utils/prefs.dart';

Unidade unidadeFromJson(String str) => Unidade.fromJson(json.decode(str));

String unidadeToJson(Unidade data) => json.encode(data.toJson());

class Unidade {
  Unidade({
    this.unidades,
  });

  List<UnidadeElement> unidades;

  factory Unidade.fromJson(Map<String, dynamic> json) => Unidade(unidades: List<UnidadeElement>.from(json["unidades"].map((x) => UnidadeElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "unidades": List<dynamic>.from(unidades.map((x) => x.toJson())),
  };

  void save() {
    Map map = toJson();
    String json = convert.json.encode(map);
    Prefs.setString("unidades.prefs", json);
  }

  static Future<Unidade> get() async {
    String json = await Prefs.getString("unidades.prefs");
    if (json.isEmpty) {
      return null;
    }
    Map map = convert.json.decode(json);
    Unidade unidade = Unidade.fromJson(map);
    var list = List<Unidade>();
    var fasdfsdf = unidade.unidades[0].cidade;
    return unidade;
  }

  static void clear() {
    Prefs.setString("unidades.prefs", "");
  }
}

class UnidadeElement {
  UnidadeElement({
    this.id,
    this.estado,
    this.cidade,
    this.nome,
  });

  String id;
  String estado;
  String cidade;
  String nome;

  factory UnidadeElement.fromJson(Map<String, dynamic> json) => UnidadeElement(
    id: json["id"],
    estado: json["estado"],
    cidade: json["cidade"],
    nome: json["nome"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "estado": estado,
    "cidade": cidade,
    "nome": nome,
  };


}






