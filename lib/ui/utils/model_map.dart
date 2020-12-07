import 'package:sinajuve_app/ui/pages/unidade/unidade.dart';

class ModelMapper {
  static dynamic fromJson<T>(Map<String, dynamic> json) {
    if (T == Unidade) {
      return Unidade.fromJson(json);
    } else
      return null;
  }
}
