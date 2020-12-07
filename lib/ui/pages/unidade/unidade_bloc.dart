import 'dart:async';
import 'package:sinajuve_app/ui/pages/unidade/unidade.dart';
import 'package:sinajuve_app/ui/pages/unidade/unidade_api.dart';
import 'package:sinajuve_app/ui/pages/unidade/unidade_detalhes.dart';
import 'package:sinajuve_app/ui/utils/simple_bloc.dart';

import '../api_response.dart';

class UnidadeBloc extends BooleanBloc {

  Future<ApiResponse<Unidade>> getData(String uj, String tipo) async {

    add(true);

    ApiResponse response = await UnidadeApi.getData(uj, tipo);

    add(false);

    return response;
  }

  Future<ApiResponse<UnidadeDetalhes>> getDetalhes(String id) async {

    add(true);

    ApiResponse response = await UnidadeApi.getUnidadeDetalhes(id);

    add(false);

    return response;
  }
}