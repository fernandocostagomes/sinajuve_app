import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sinajuve_app/ui/pages/home/icon_pages/noticias_page.dart';
import 'package:sinajuve_app/ui/utils/nav.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SobrePage extends StatefulWidget {
  SobrePage({Key key}) : super(key: key);

  @override
  _SobrePageState createState() => _SobrePageState();
}

class _SobrePageState extends State<SobrePage> {
  var _page = "Sobre";
  var _url = "";
  var _title = "Sobre";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _page == "Sobre"
          ? ListView(
              children: [
                _listTile("Conceito e Diretrizes",
                    url: 'https://sinajuve.ibict.br/conceito-e-diretrizes/',
                    trailing: true,
                    fontSize: 15,
                    context: context),
                _listTile("Objetivos",
                    url: 'https://sinajuve.ibict.br/objetivos/',
                    fontSize: 15,
                    trailing: true,
                    context: context),
                _listTile("Quem é quem",
                    url: 'https://sinajuve.ibict.br/quem-e-quem/',
                    fontSize: 15,
                    trailing: true,
                    context: context),
                _listTile("FAQ",
                    url: 'https://sinajuve.ibict.br/faq/',
                    fontSize: 15,
                    trailing: true,
                    context: context),
                _listTile("Programas da SNJ",
                    url: 'https://sinajuve.ibict.br/programassnj/',
                    fontSize: 15,
                    trailing: true,
                    context: context),
                _listTile("Prêmio de inovação",
                    url: 'https://sinajuve.ibict.br/programa-premio/',
                    fontSize: 15,
                    trailing: true,
                    context: context),
                SizedBox(
                  height: 80,
                ),
                Expanded(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          abrirUrl("https://www.instagram.com/snjuventude");
                        },
                        child: Image.asset(
                          "assets/images/instagram.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          abrirUrl("https://twitter.com/SNJuventude");
                        },
                        child: Image.asset(
                          "assets/images/twitter.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          abrirUrl("https://www.youtube.com/c/mdhbrasil");
                        },
                        child: Image.asset(
                          "assets/images/youtube.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                        },
                        child: Image.asset(
                          "assets/images/facebook.png",
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
                  ],
                )
          : _body(),
    );
  }

  Card _listTile(title,
      {trailing, subtitle, url, double fontSize = 17, context}) {
    return Card(
        child: ListTile(
      title: Container(
        width: double.infinity,
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      trailing: trailing == true ? Icon(Icons.arrow_forward) : null,
      subtitle: subtitle != null
          ? Row(
              children: [],
            )
          : null,
      onTap: () {
        setState(() {
          _page = title;
          _url = url;
          _title = title;
        });
      },
    ));
  }

  Card _listTileSocialNetworks(title,
      {trailing, subtitle, url, double fontSize = 17, context}) {
    return Card(
        child: ListTile(
      title: Container(
        width: double.infinity,
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      trailing: trailing == true ? Icon(Icons.arrow_forward) : null,
      subtitle: subtitle != null
          ? Row(
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        abrirUrl("context, page");
                      },
                      child: Image.asset(
                        "assets/images/instagram.png",
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/images/twitter.png",
                      fit: BoxFit.contain,
                      height: 60,
                    ),
                  ],
                ),
              ],
            )
          : null,
      onTap: () {
        setState(() {
          _page = title;
          _url = url;
          _title = title;
        });
      },
    ));
  }

  _expandedIcon(BuildContext context, pathIcon, Widget page) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {
          push(context, page);
        },
        child: Image.asset(
          pathIcon,
          width: 100,
          height: 100,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  _body() {
    return WebView(
      initialUrl: _url,
      javaScriptMode: JavaScriptMode.unrestricted,
    );
  }
}

_expandedIcon(BuildContext context, pathIcon, Widget page) {
  return Expanded(
    flex: 1,
    child: InkWell(
      onTap: () {
        push(context, page);
      },
      child: Image.asset(
        pathIcon,
        width: 100,
        height: 100,
        fit: BoxFit.contain,
      ),
    ),
  );
}
