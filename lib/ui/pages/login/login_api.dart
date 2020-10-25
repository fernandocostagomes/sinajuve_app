import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sinajuve_app/ui/pages/login/user.dart';
import '../api_response.dart';

class LoginApi {
  static Future<ApiResponse<User>> login(String login, String senha) async {
    try {
      bool result = false;

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
        final user = User.fromJson(mapResponse);
        user.save();
        return ApiResponse.ok(result: user);
      }

      return ApiResponse.error(msg: mapResponse["error"]);
    }catch(error, exception) {
      print("Error no login $error > $exception");

      return ApiResponse.error(msg: "Não foi possível fazer o login.");
    }
  }
}
