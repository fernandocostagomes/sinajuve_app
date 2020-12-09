import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sinajuve_app/ui/pages/api_response.dart';
import 'package:sinajuve_app/ui/pages/home/home_page.dart';
import 'package:sinajuve_app/ui/pages/login/login.dart';
import 'package:sinajuve_app/ui/utils/alert.dart';
import 'package:sinajuve_app/ui/utils/nav.dart';
import 'login_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _bloc = LoginBloc();
  var _tUsuario = TextEditingController();
  var _tPwd = TextEditingController();
  var loginPrefs = Login();

   FocusNode _focusPage;
  bool _showProgress = false;
  bool _checkedValue = false;

  @override
  void initState() {
    super.initState();
    _checkUser();
    _focusPage = FocusNode();
  }

  @override
  void dispose() {
    _focusPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //_checkUser();
    return Scaffold(
      appBar: AppBar(
        title: Text("Sinajuve - Login"),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            _text("Usuário",
                autoFocus: true,
                focusNode: false,
                controller: _tUsuario =
                new TextEditingController(
                    text: loginPrefs != null  && loginPrefs.login != ""
                    ? loginPrefs.login
                    : ""),
                hint: loginPrefs == null ? "Digite seu usuário" : null,
                validator: _validateUsuario),
            _text("Senha",
                autoFocus: false,
                focusNode: true,
                controller: _tPwd =
                new TextEditingController(
                    text: loginPrefs != null && loginPrefs.password != ""
                    ? loginPrefs.password
                    : ""),
                hint: loginPrefs != null
                    ? null
                    : "Digite sua senha",
                pwd: true,
                validator: _validateSenha),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: Text("Lembrar senha"),
              value: _checkedValue,
              onChanged: (newValue) {
                _checkedValue = newValue;
                setState(() {
                  if (newValue == true) {
                    _checkedValue = true;
                    Login login = new Login(login: _tUsuario.text, password: _tPwd.text);
                    login.save();
                    _checkUser();
                  }
                });
              },
              controlAffinity: ListTileControlAffinity
                  .leading, //  <-- leading Checkbox
            ),
            _button(context, "Login"),
            Container(
              margin: EdgeInsets.only(
                  top: 20),
              child: InkWell(
                onTap: null,
                child: Text("Cadastre-se",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              child:
              InkWell(
                onTap: _onClickCadastrar,
                child: Text("Perdeu a senha?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                      color: Colors.blue,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  _onClickCadastrar() async {
    push(context, HomePage(), replace: true);
  }

  _text(text, {
    String hint,
    FormFieldValidator<String> validator,
    bool autoFocus,
    TextEditingController controller,
    bool focusNode,
    pwd = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: pwd,
      validator: validator,
      autofocus: true,
      focusNode: focusNode == true ? _focusPage : null,
      //autofocus: autoFocus == null ? false : autoFocus,
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
      if (_checkedValue) {
        Login login = new Login(login: user, password: pwd);
        login.save();
      }
      Fluttertoast.showToast(
          msg: "Login efetuado com sucesso!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0
      );
      push(context, HomePage());
    } else {
      alert(context,
          response.msg == null ? "Usuário ou senha inválido!" : response.msg);
    }
    setState(() {
      _showProgress = false;
    });
  }

  _checkUser() async {
    loginPrefs = await Login.get();
    setState(() {
      loginPrefs != null ? _checkedValue = true : _checkedValue = false;
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