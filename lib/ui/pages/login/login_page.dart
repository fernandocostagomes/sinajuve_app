import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sinajuve_app/ui/pages/api_response.dart';
import 'package:sinajuve_app/ui/pages/home/home_page.dart';
import 'package:sinajuve_app/ui/pages/login/login_api.dart';
import 'package:sinajuve_app/ui/utils/nav.dart';

import 'login_bloc.dart';
import 'user.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _bloc = LoginBloc();
  final _tUsuario = TextEditingController();
  final _tPwd = TextEditingController();

  //final _focusSenha = FocusNode();
  bool _showProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sinajuve - Login"),
      ),
      body: _body(context),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  _body(context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            _text(
              "Usuário",
              "Digite seu usuário",
              autoFocus: true,
              controller: _tUsuario,
              validator: _validateUsuario,
            ),
            SizedBox(
              height: 10,
            ),
            _text(
              "Senha",
              "Digite sua senha",
              controller: _tPwd,
              pwd: true,
              validator: _validateSenha,
            ),
            SizedBox(
              height: 20,
            ),
            _button(context, "Conectar")
          ],
        ),
      ),
    );
  }

  _text(
    text,
    hint, {
    FormFieldValidator<String> validator,
    bool autoFocus,
    TextEditingController controller,
    pwd = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: pwd,
      validator: validator,
      autofocus: autoFocus == null ? false : autoFocus,
      style: TextStyle(fontSize: 25, color: Colors.blue),
      decoration: InputDecoration(
          labelText: text, hintText: hint, labelStyle: TextStyle(fontSize: 16)),
    );
  }

  Container _button(context, text) {
    return Container(
      height: 46,
      child: RaisedButton(
        color: Colors.blue,
        child: _showProgress
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
        onPressed: () => _onClickLogin(context),
      ),
    );
  }

  void _onClickLogin(context) async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    String user = _tUsuario.text;
    String pwd = _tPwd.text;

    setState(() {
      _showProgress = true;
    });

    ApiResponse response = await _bloc.login(user, pwd);

    if (response.ok) {
      push(context, HomePage());
      setState(() {
        _showProgress = false;
      });
    }
  }

  String _validateUsuario(String value) {
    if (value.isEmpty) {
      return "Digite o usuário";
    }
    return null;
  }

  String _validateSenha(String value) {
    if (value.isEmpty) {
      return "Digite a senha";
    }
    if (value.length < 6) {
      return "A senha está menor do que o permitido";
    }
    return null;
  }
}
