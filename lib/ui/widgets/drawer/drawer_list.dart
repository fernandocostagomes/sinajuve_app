import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sinajuve_app/ui/pages/home/home_page.dart';
import 'package:sinajuve_app/ui/pages/login/login_page.dart';
import 'package:sinajuve_app/ui/pages/login/user.dart';
import 'package:sinajuve_app/ui/utils/nav.dart';
import 'package:sinajuve_app/ui/utils/prefs.dart';

import '../text.dart';

class DrawerList extends StatefulWidget {
  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  @override
  Widget build(BuildContext context) {
    Future<User> future = User.get();
    return _safeArea();
  }

  _safeArea() {
    Future<User> future = User.get();
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            FutureBuilder<User>(
              future: future,
              builder: (context, snapshot) {
                User user = snapshot.data;
                return user != null ? _header(user.userNicename, user.userEmail) : _header("Nome:", "Email:" );
              },
            ),
            FutureBuilder<User>(
              future: future,
              builder: (context, snapshot) {
                User user = snapshot.data;
                return user != null ? _listTileExit() : _listTileEnter();
              },
            ),
//            ListTile(
//                leading: user != null ? Icon(Icons.error) : Icon(Icons.title),
//                //leading: _icon == "Icons.input" ? Icon(Icons.input) : Icon(Icons.undo),
//                title: Text(_title == "Entrar" ? "Entrar": "Sair"),
//                subtitle: Text(_subTitle != "Autenticar no servidor..." ? "Autenticar no servidor..." : "Desconectar do servidor..."),
//                onTap: () {
//                  _onTap == "push" ? push(context, LoginPage()) : _onClickLogout(context);
//                }),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Ajuda"),
              subtitle: Text("Dúvidas sobre o Sinajuve..."),
              onTap: () {

              },
            ),
          ],
        ),
      ),
    );
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

  ListTile _listTileEnter(){
    return ListTile(
        leading: Icon(Icons.input),
        title: Text("Entrar"),
        subtitle: Text("Autenticar no servidor..."),
        onTap: () {
          push(context, LoginPage());
        });
  }

  ListTile _listTileExit(){
    return ListTile(
        leading: Icon(Icons.undo),
        title: Text("Sair"),
        subtitle: Text("Desconectar do servidor..."),
        onTap: () {
          _onClickLogout(context);
        });
  }

  _onClickLogout(BuildContext context) {
    User.clear();
    Navigator.pop(context);
    push(context, HomePage());
  }
}
