import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sinajuve_app/ui/pages/login/usuario.dart';
import 'package:sinajuve_app/ui/pages/login/roles.dart';
import 'package:sinajuve_app/ui/utils/connectivity_infra.dart';
import '../api_response.dart';

class LoginApi {
  static Future<ApiResponse<Usuario>> login(String login, String senha) async {
    try {
      HttpClient client = new HttpClient();

      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

      final contents = StringBuffer();
      final completer = Completer<String>();

      var url = "https://sinajuve.ibict.br/wp-json/jwt-auth/v1/token?";

      Map params = {
        "username": login,
        "password": senha,
      };

      HttpClientRequest request = await client.postUrl(Uri.parse(url));

      request.headers.set('content-type', 'application/json');

      request.add(utf8.encode(json.encode(params)));

      HttpClientResponse response = await request.close();

      response.transform(utf8.decoder).listen((event) {
        contents.write(event);
      }, onDone: () => completer.complete(contents.toString()));
      Map mapResponse = json.decode(await completer.future);

      if (response.statusCode == 200) {
        final user = Usuario.fromJson(mapResponse);
        ApiResponse responseRoles = await LoginApi.getRoles(user.token);
        if(responseRoles.ok){
          user.save();
          return ApiResponse.ok(result: user);
        }
      }
      return ApiResponse.error(msg: mapResponse["message"]);
    } catch (error, exception) {
      return ApiResponse.error(msg: "Não foi possível fazer o login.");
    }
  }

  static Future<ApiResponse<Roles>> getRoles(String token) async {
    try {
      HttpClient client = new HttpClient();

      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

      final contents = StringBuffer();
      final completer = Completer<String>();

      var url = "https://sinajuve.ibict.br/wp-json/sinajuve/v1/get_role";

      HttpClientRequest request = await client.getUrl(Uri.parse(url));

      request.headers.set('content-type', 'application/json');
      request.headers.set('authorization', 'Bearer $token');

      HttpClientResponse response = await request.close();

      response.transform(utf8.decoder).listen((event) {
        contents.write(event);
      }, onDone: () => completer.complete(contents.toString()));
      String futureResponse = await completer.future;

      if (response.statusCode == 200) {
        final roles = Roles.parseJson(await completer.future);
        roles.save();
        //AdesaoApi.getData();
        return ApiResponse.ok(result: roles);
      }
      return ApiResponse.error(msg: "Error");
    } catch (error, exception) {
      return ApiResponse.error(msg: "Não foi possível fazer o login.");
    }
  }
}
