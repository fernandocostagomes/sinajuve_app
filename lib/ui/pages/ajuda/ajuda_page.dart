import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AjudaPage extends StatefulWidget {
  AjudaPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AjudaPageState createState() => _AjudaPageState();
}

class _AjudaPageState extends State<AjudaPage> {
  var page = "Page";
  var url = "";
  var title = "Ajuda";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body:
      page == "Page" ? ListView(
        children: [
          _listTile("Sobre o Sinajuve", fontSize: 15, context: context)
        ],
      ) : _body(url),
    );
  }

  Card _listTile(title, {subtitle, url, double fontSize = 17, context}) {
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
      trailing: Icon(Icons.arrow_forward),
      onTap: () {
        setState(() {
          page = "Objetivos";
          url = 'https://sinajuve.ibict.br/conceito-e-diretrizes/';
          title = "Objetivos";
        });

      },
    ));
  }

  _body(url) {
    return WebView(
      initialUrl: url,
      javaScriptMode: JavaScriptMode.unrestricted,
    );
  }
}
