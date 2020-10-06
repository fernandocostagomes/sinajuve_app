import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final _tUsuario = TextEditingController();
  final _tSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sinajuve - Login"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            _text("Usuário", "Digite seu usuário", autoFocus: true, controller: _tUsuario, validator: _validateUsuario,),
            SizedBox(
              height: 10,
            ),
            _text("Senha", "Digite sua senha", controller: _tSenha, pwd: true, validator: _validateSenha,),
            SizedBox(
              height: 20,
            ),
            _button("Conectar", onPressed: _onClickLogin)
          ],
        ),
      ),
    );
  }



  _text(text, hint, {FormFieldValidator<String> validator, bool autoFocus, TextEditingController controller, pwd = false,}) {
    return TextFormField(
      controller: controller,
      obscureText: pwd,
      validator: validator,
      autofocus: autoFocus == null ? false : autoFocus,
      style: TextStyle(
          fontSize: 25,
          color: Colors.blue),
      decoration: InputDecoration(
          labelText: text,
          hintText: hint,
          labelStyle: TextStyle(
              fontSize: 16)
      ),
    );
  }

  Container _button(text, {Function onPressed}) {
    return Container(
      height: 46,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }

  _onClickLogin() {
    if(! _formKey.currentState.validate() ) {
      return;
    }

    String usuario = _tUsuario.text;
    String senha = _tSenha.text;
  }

  String _validateUsuario(String value) {
      if(value.isEmpty ){
        return "Digite o usuário";
      }
      return null;
    }

  String _validateSenha(String value) {
    if(value.isEmpty ){
      return "Digite a senha";
    }
    if(value.length < 6){
      return "A senha está menor do que o permitido";
    }
    return null;
  }
}
