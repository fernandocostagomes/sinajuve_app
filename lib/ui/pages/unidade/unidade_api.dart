import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:sinajuve_app/ui/pages/login/usuario.dart';
import 'package:sinajuve_app/ui/pages/unidade/unidade.dart';
import 'package:sinajuve_app/ui/pages/unidade/unidade_detalhes.dart';
import '../api_response.dart';

class UnidadeApi {
  static Future<ApiResponse<Unidade>> getData(String uj, String tipo) async {
    try {
      HttpClient client = new HttpClient();

      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

      final contents = StringBuffer();
      final completer = Completer<String>();

      var url = "https://sinajuve.ibict.br/wp-json/sinajuve/v1/$tipo/$uj";

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
      String futureResponse = await completer.future;
      String addTag = '{"unidades": $futureResponse }';
      Map mapResponse = json.decode(addTag);

      if (response.statusCode == 200) {
        final unidade = Unidade.fromJson(mapResponse);
        unidade.save();
        return ApiResponse.ok(result: unidade);
      }else if(response.statusCode == 404)
      {
        return ApiResponse.error(msg: response.statusCode.toString());
      }
    } catch (error, exception) {
      print("Error ao solicitar dados: $error > $exception");
      return ApiResponse.error(msg: "Não foi possível baixar os dados.");
    }
    return ApiResponse.error(msg: "Erro desconhecido.");
  }

  static Future<ApiResponse<UnidadeDetalhes>> getUnidadeDetalhes(String id) async {
    try {
      HttpClient client = new HttpClient();

      client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);

      final contents = StringBuffer();
      final completer = Completer<String>();

      var url = "https://sinajuve.ibict.br/wp-json/sinajuve/v1/entry_id/$id";

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
        final unidadeDetalhes = UnidadeDetalhes.fromJson(mapResponse);
        unidadeDetalhes.save();
        return ApiResponse.ok(result: unidadeDetalhes);
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
