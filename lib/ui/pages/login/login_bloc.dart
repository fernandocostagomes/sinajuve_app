
import 'dart:async';

import 'package:sinajuve_app/ui/pages/login/usuario.dart';
import 'package:sinajuve_app/ui/utils/simple_bloc.dart';

import '../api_response.dart';
import 'login_api.dart';

class LoginBloc extends BooleanBloc {

  Future<ApiResponse<Usuario>> login(String login, String senha) async {

    add(true);

    ApiResponse response = await LoginApi.login(login, senha);

    add(false);

    return response;
  }
}