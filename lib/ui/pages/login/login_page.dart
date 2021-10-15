import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sinajuve_app/ui/pages/api_response.dart';
import 'package:sinajuve_app/ui/pages/home/home_page.dart';
import 'package:sinajuve_app/ui/pages/login/login.dart';
import 'package:sinajuve_app/ui/utils/alert.dart';
import 'package:sinajuve_app/ui/utils/nav.dart';
import 'login_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage(this.userOld);
  final String userOld;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _bloc = LoginBloc();
  var _tUsuario = TextEditingController();
  var _tPwd = TextEditingController();
  var loginPrefs = Login();
  var _showPwd = false;

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
                controller: _tUsuario = new TextEditingController(
                    text: loginPrefs != null && loginPrefs.login != ""
                        ? loginPrefs.login
                        : _tUsuario.text == null ? "" : _tUsuario.text),
                hint: loginPrefs == null ? "Digite seu usuário" : null,
                validator: _validateUsuario),
            _textPwd("Senha",
                autoFocus: false,
                focusNode: true,
                controller: _tPwd = new TextEditingController(
                    text: loginPrefs != null && loginPrefs.password != ""
                        ? loginPrefs.password
                        : _tPwd.text == null ? "" : _tPwd.text),
                hint: loginPrefs != null ? null : "Digite sua senha",
                pwd: true,
                validator: _validateSenha),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              activeColor: Colors.black,
              title: Text("Lembrar senha"),
              value: _checkedValue,
              onChanged: (newValue) {
                _checkedValue = newValue;
                setState(() {
                  if (newValue == true) {
                    _checkedValue = true;
                    Login login =
                    new Login(login: _tUsuario.text, password: _tPwd.text);
                    login.save();
                    _checkUser();
                  }
                });
              },
              controlAffinity:
              ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
            _button(context, "Login"),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: InkWell(
                onTap: _onClickCadastrese,
                child: Text(
                  "Cadastre-se",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              child: InkWell(
                onTap: _onClickPerdeuSenha,
                child: Text(
                  "Perdeu a senha?",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,),
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

  _onClickPerdeuSenha() async {
    abrirUrl("https://sinajuve.ibict.br/lostpassword/");
  }

  _onClickCadastrese() async {
    abrirUrl("https://sinajuve.ibict.br/signup/");
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
      style: TextStyle(fontSize: 25, color: Colors.black),
      decoration: InputDecoration(
        labelText: text,
        hintText: hint,
        labelStyle: TextStyle(fontSize: 16, color: Colors.black),

      )
      ,
    );
  }

  _textPwd(text, {
    String hint,
    FormFieldValidator<String> validator,
    bool autoFocus,
    TextEditingController controller,
    bool focusNode,
    pwd = false,
  }) {
    return TextFormField(
        controller: controller,
        obscureText: _showPwd == false ? true : false,
        validator: validator,
        autofocus: true,
        focusNode: focusNode == true ? _focusPage : null,
        //autofocus: autoFocus == null ? false : autoFocus,
        style: TextStyle(fontSize: 25, color: Colors.black),
    decoration: InputDecoration(
    labelText: text,
    hintText: hint,
    labelStyle: TextStyle(fontSize: 16, color: Colors.black),
    suffixIcon: GestureDetector(
    child: Icon( _showPwd == false ? Icons.visibility_off : Icons.visibility, color: Colors.black,
    ),
    onTap: (){
      setState(() {
        _showPwd = !_showPwd;
      });
    }),

    )
    ,
    );
    }

  Container _button(context, text) {
    return Container(
      height: 46,
      child: RaisedButton(
        color: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
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
          fontSize: 16.0);
      if(user ==  widget.userOld)
        {
          pop(context, HomePage());
        }
      else
        push(context, HomePage());

    } else {
      response.msg = "Usuário ou senha inválido!";
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
