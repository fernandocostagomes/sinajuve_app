import 'dart:async';
import 'package:sinajuve_app/ui/pages/adesao/adesao.dart';
import 'package:sinajuve_app/ui/pages/adesao/adesao_api.dart';
import 'package:sinajuve_app/ui/utils/simple_bloc.dart';

import '../api_response.dart';

class AdesaoBloc extends BooleanBloc {

  Future<ApiResponse<Adesao>> getData( ) async {

    add(true);

    ApiResponse response = await AdesaoApi.getData();

    add(false);

    return response;
  }
}