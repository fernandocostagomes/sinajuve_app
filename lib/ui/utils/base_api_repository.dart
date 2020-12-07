import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'http_result.dart';
import 'model_map.dart';

class BaseApiRepository<Entity> {
  String endPointUrl;
  final client = http.Client();
  BaseApiRepository(this.endPointUrl);

  Future<HttpResult<List<Entity>>> all({String suffixPath}) async {
    var responseResult = await http.get(
        await _formatUrl(suffixPath: suffixPath),
        headers: await _header());

    if (responseResult != null) {
      return _treatListResult<Entity>(responseResult);
    }
    return null;
  }

  Future<HttpResult<List<Entity>>> allByFilter(
      {String suffixPath, String filter}) async {
    var responseResult = await http.get(
        await _formatUrl(suffixPath: '$filter'),
        headers: await _header());

    if (responseResult != null) {
      return _treatListResult<Entity>(responseResult);
    }
    return null;
  }

//  Future<HttpResult<Entity>> one({String sufixPath}) async {}
//
//  Future<HttpResult<Entity>> post(dynamic data, {String sufixPath}) async {}
//
//  Future<HttpResult<Entity>> put(dynamic data, {String sufixPath}) async {}

//  Future<HttpResult<Entity>> delete<Entity>(
//      {@required String sufixPath}) async {}

  Future<Map<String, String>> _header() async {
    final map = Map<String, String>();
    map['content-type'] = 'application/json';
    return map;
  }

//  String _treatBody(dynamic data) {
//    if (data != null && data != '')
//      return jsonEncode(data);
//    else
//      return null;
//  }

  HttpResult<List<T>> _treatListResult<T>(Response response) {
    var list = List<T>();

    if (response.statusCode == 200 || response.statusCode == 201) {
      if (response.body != null && response.body.isNotEmpty) {
        var listBody = json.decode(response.body);
        listBody.forEach((item) => list.add(ModelMapper.fromJson<T>(item)));
        return HttpResult<List<T>>.ok(list);
      } else {
        return HttpResult<List<T>>.ok(null);
      }
    } else
      return _treatFailResult(response);
  }

//  HttpResult<T> _treatResult<T>(Response response) {
//    if (response.statusCode == 200 || response.statusCode == 201) {
//      if (response.body != null && response.body.isNotEmpty) {
//        var map = json.decode(response.body);
//        if (map is Map<String, dynamic>) {
//          var obj = ModelMapper.fromJson<T>(map);
//          return HttpResult<T>.ok(obj);
//        }
//        return HttpResult<T>.ok(map);
//      } else {
//        return HttpResult<T>.ok(null);
//      }
//    } else
//      return _treatFailResult(response);
//  }

  HttpResult<T> _treatFailResult<T>(Response response) {
    if (response.statusCode == 400) {
      if (response.body != null && response.body.contains('{')) {
        var map = json.decode(response.body);

        return HttpResult<T>.badRequest(map);
      }
      return HttpResult<T>.badRequest(response.body);
    } else if (response.statusCode == 500) {
      return HttpResult<T>.badRequest(response.body);
    } else
      return HttpResult<T>.notFound();
  }

  Future<String> _formatUrl({String suffixPath}) async {
    //title=revista&_per_page=10&_page=1
    final url = "http://kohatreinamento.ibict.br/api/v1/public";
    //final url = 'http://kohatreinamento.ibict.br/api/v1/';

    if (suffixPath != null && suffixPath.isNotEmpty) {
      return '$url$endPointUrl$suffixPath';
    }
    return '$url$endPointUrl';
    //return url;
  }
}
