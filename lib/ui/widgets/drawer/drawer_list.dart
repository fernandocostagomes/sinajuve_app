import 'package:flutter/material.dart';
import 'package:sinajuve_app/ui/pages/login/login_page.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Nome: Sinajuve"),
            accountEmail: Text("E-mail: sinajuve@ibict.br"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/avatarwhite18dp.png"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text("Entrar"),
            subtitle: Text("Autenticar no Sinajuve..."),
            onTap: () {
              print("Item entrar");
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                return LoginPage();
                }));
              },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text("Ajuda"),
            subtitle: Text("Dúvidas sobre o Sinajuve..."),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                return LoginPage();
              }));
              LoginPage();
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text("Ajuda"),
            subtitle: Text("Dúvidas sobre o Sinajuve..."),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                return LoginPage();
              }));
              LoginPage();
            },
          ),
        ],
      ),
    );
  }
}
