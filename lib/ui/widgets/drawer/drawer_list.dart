import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sinajuve_app/ui/pages/adesao/adesao.dart';
import 'package:sinajuve_app/ui/pages/ajuda/sobre_page.dart';
import 'package:sinajuve_app/ui/pages/api_response.dart';
import 'package:sinajuve_app/ui/pages/home/home_page.dart';
import 'package:sinajuve_app/ui/pages/login/login.dart';
import 'package:sinajuve_app/ui/pages/login/login_page.dart';
import 'package:sinajuve_app/ui/pages/login/roles.dart';
import 'package:sinajuve_app/ui/pages/login/usuario.dart';
import 'package:sinajuve_app/ui/pages/adesao/adesao_page.dart';
import 'package:sinajuve_app/ui/pages/unidade/unidade_bloc.dart';
import 'package:sinajuve_app/ui/pages/unidade/unidade_tipo_page.dart';
import 'package:sinajuve_app/ui/utils/nav.dart';

class DrawerList extends StatefulWidget {
  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  Usuario usuario;
  Roles roles;

  @override
  void initState() {
    _carregarDados();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _safeArea();
  }

  _safeArea() {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            usuario != null
                ? _header(
                    usuario.userDisplayName,
                    usuario.userEmail,
                  )
                : _header("Olá,", "Seja bem-vindo ao Sinajuve!"),
            usuario != null ? Container() : _listTileEnter(),
            _getFutureBuilder("gerente"),
            _getFutureBuilder("avaliador_sinajuve"),
            _getFutureBuilder("gestor"),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Sobre"),
              subtitle: Text("Dúvidas sobre o Sinajuve..."),
              onTap: () {
                push(context, SobrePage());
              },
            ),
            //ListTile builder logout
            usuario != null ? _listTileExit() : Container(),
          ],
        ),
      ),
    );
  }

  Widget _getFutureBuilder(p_role) {
    if (roles != null) {
      return _isRoles(p_role) == true ? _listTileRoles(p_role) : Container();
    } else
      return Container();
  }

  bool _isRoles(String pRole) {
    var result = false;
    for (String role in roles.roles) {
      if (role == (pRole)) result = true;
    }
    return result;
  }

  ListTile _listTileRoles(String pRoles) {
    // case "gestor":
    // case "quase_gestor":
    // case "futuro_gestor":
    //   rolesBetter = role;
    //   break;
    // case "avaliador_sinajuve":
    String title;
    String subtitle;
    IconData iconData;
    switch (pRoles) {
      case "gestor":
      case "quase_gestor":
      case "futuro_gestor":
        title = "Adesão";
        subtitle = "Visualizar minha adesão";
        iconData = Icons.assignment;
        break;
      case "avaliador_sinajuve":
        title = "Unidades em análise";
        subtitle = "Visualizar unidades em análise";
        iconData = Icons.home;
        break;
      case "gerente":
        title = "Unidades de juventude";
        subtitle = "Visualizar todas unidades de juventude";
        iconData = Icons.home;
        break;
      default:
        title = "Adesão";
        subtitle = "Visualizar minha adesão";
        iconData = Icons.assignment;
        break;
    }
    return ListTile(
        leading: Icon(iconData),
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: () {
          _goPage(pRoles);
        });
  }

  _goPage(String pRoles) {
    switch (pRoles) {
      case "subscriber":
      case "gestor":
      case "quase_gestor":
      case "futuro_gestor":
        push(context, AdesaoPage());
        break;
      case "avaliador_sinajuve":
        push(context, UnidadeTipoPage("avaliador"));
        break;
      case "gerente":
        push(context, UnidadeTipoPage("gerente"));
        break;
    }
  }

  UserAccountsDrawerHeader _header(accountname, accountemail) {
    var names = accountname.split(" ");
    String letter;
    if (names.length > 1) {
      letter = names[0].substring(0, 1).toUpperCase() +
          names[1].substring(0, 1).toUpperCase();
    } else if (names[0] == "Olá,")
      letter = "N";
    else
      letter = names[0].substring(0, 1).toUpperCase();
    //letter = letter.toUpperCase();

    return UserAccountsDrawerHeader(
      accountName: Text(accountname),
      accountEmail: Text(accountemail),
      currentAccountPicture: letter == "N"
          ? CircleAvatar(
              backgroundImage: AssetImage("assets/images/avatarwhite18dp.png"),
            )
          : Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.grey,
              ),
              child: Text(
                letter,
                style: TextStyle(fontSize: 32),
              ),
            ),
    );
  }

  ListTile _listTileEnter() {
    return ListTile(
        leading: Icon(Icons.input),
        title: Text("Entrar"),
        subtitle: Text("Autenticar no servidor..."),
        onTap: () async {
          Login loginPrefs = await Login.get();
          await push(context, LoginPage(loginPrefs == null ? "user" : loginPrefs.login)).whenComplete(() => _carregarDados());
        });
  }

  ListTile _listTileExit() {
    return ListTile(
        leading: Icon(Icons.undo),
        title: Text("Sair"),
        subtitle: Text("Desconectar do servidor..."),
        onTap: () {
          _onClickLogout(context);
        });
  }

  void _carregarDados() async {
    usuario = await Usuario.get();
    roles = await Roles.get();
    setState(() {});
  }

  _onClickLogout(BuildContext context) {
    try {
      Usuario.clear();
      Roles.clear();
      Login.clear();
      Adesao.clear();
      Fluttertoast.showToast(
          msg: "Logoff efetuado com sucesso!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
      push(context, HomePage());
    } on Exception catch (exception) {} catch (error) {}
  }
}
