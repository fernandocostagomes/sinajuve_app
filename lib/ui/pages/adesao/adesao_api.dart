import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sinajuve_app/ui/pages/adesao/adesao.dart';
import 'package:sinajuve_app/ui/pages/login/usuario.dart';
import '../api_response.dart';

class AdesaoApi {
  static Future<ApiResponse<Adesao>> getData() async {
    try {
      HttpClient client = new HttpClient();

      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

      final contents = StringBuffer();
      final completer = Completer<String>();

      var url = "https://sinajuve.ibict.br/wp-json/sinajuve/v1/show";

      HttpClientRequest request = await client.getUrl(Uri.parse(url));

      var user = await Usuario.get();

      var token = user.token;

      request.headers.set('content-type', 'application/json');
      request.headers.set('authorization', 'Bearer $token');

      request.headers.set('content-type', 'application/json');

      HttpClientResponse response = await request.close();

      response.transform(utf8.decoder).listen((event) {
        contents.write(event);
      }, onDone: () => completer.complete(contents.toString()));
      Map mapResponse = json.decode(await completer.future);

      if (response.statusCode == 200) {
        final accession = Adesao.fromJson(mapResponse);
        accession.save();
        return ApiResponse.ok(result: accession);
      }else if(response.statusCode == 404)
        {
          return ApiResponse.error(msg: mapResponse["message"]);
        }
      return ApiResponse.error(msg: mapResponse["message"]);
    } catch (error, exception) {
      print("Error ao solicitar dados: $error > $exception");
      return ApiResponse.error(msg: "Não foi baixar os dados.");
    }
  }
}
