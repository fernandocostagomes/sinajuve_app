import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sinajuve_app/ui/pages/adesao/adesao.dart';
import 'package:sinajuve_app/ui/pages/home/home_page.dart';
import 'package:sinajuve_app/ui/pages/login/login.dart';
import 'package:sinajuve_app/ui/pages/login/login_page.dart';
import 'package:sinajuve_app/ui/pages/login/roles.dart';
import 'package:sinajuve_app/ui/pages/login/usuario.dart';
import 'package:sinajuve_app/ui/pages/adesao/adesao_page.dart';
import 'package:sinajuve_app/ui/pages/unidade/unidade_tipo_page.dart';
import 'package:sinajuve_app/ui/utils/nav.dart';

class DrawerList extends StatefulWidget {
  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  @override
  Widget build(BuildContext context) {
    return _safeArea();
  }

  _safeArea() {
    Future<Usuario> futureUser = Usuario.get();
    Future<Roles> futureRole = Roles.get();
    var enterExit = false;
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            FutureBuilder<Usuario>(
              future: futureUser,
              builder: (context, snapshot) {
                Usuario usuario = snapshot.data;
                return usuario != null
                    ? _header(usuario.userNicename, usuario.userEmail)
                    : _header("Nome:", "Email:");
              },
            ),
            FutureBuilder<Usuario>(
              future: futureUser,
              builder: (context, snapshot) {
                Usuario usuario = snapshot.data;
                //usuario != null ? enterExit = true : enterExit = false;
                //return enterExit == true ? Container() : _listTileEnter();
                return usuario != null ? Container() : _listTileEnter();
              },
            ),
            _getFutureBuilder(futureRole, "gerente"),
            _getFutureBuilder(futureRole, "avaliador_sinajuve"),
            _getFutureBuilder(futureRole, "gestor"),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Ajuda"),
              subtitle: Text("Dúvidas sobre o Sinajuve..."),
              onTap: () {
              },
            ),
            //ListTile builder logout
            FutureBuilder<Usuario>(
              future: futureUser,
              builder: (context, snapshot) {
                Usuario usuario = snapshot.data;
                return usuario != null
                    ? _listTileExit()
                    : Container();
              },
            ),
          ],
        ),
      ),
    );
  }

  FutureBuilder _getFutureBuilder(Future future, p_role){
     return FutureBuilder<Roles>(
      future: future,
      builder: (context, snapshot) {
        Roles roles = snapshot.data;
        if(roles != null){
          return _isRoles(roles, p_role) == true
              ? _listTileRoles(p_role)
              : Container();
        }else
          return Container();
      },
    );
  }

  bool _isRoles(Roles pRoles, String pRole){
    var result = false;
      for(String role in pRoles.roles){
        if(role == (pRole))
          result  = true;
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
        iconData = Icons.home_work;
        break;
      case "gerente":
        title = "Unidades de juventude";
        subtitle = "Visualizar todas unidades de juventude";
        iconData = Icons.home_work;
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

  @override
  void initState() {
    super.initState();
  }

  UserAccountsDrawerHeader _header(accountname, accountemail) {
    return UserAccountsDrawerHeader(
      accountName: Text(accountname),
      accountEmail: Text(accountemail),
      currentAccountPicture: CircleAvatar(
        backgroundImage: AssetImage("assets/images/avatarwhite18dp.png"),
      ),
    );
  }

  ListTile _listTileEnter() {
    return ListTile(
        leading: Icon(Icons.input),
        title: Text("Entrar"),
        subtitle: Text("Autenticar no servidor..."),
        onTap: () {
          push(context, LoginPage(), replace: true);
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
          fontSize: 16.0
      );
      push(context, HomePage( ));
    } on Exception catch (exception) {
    } catch (error) {
    }
  }
}
