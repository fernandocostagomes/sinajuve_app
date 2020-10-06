import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PublicPolMapPage extends StatefulWidget {
  @override
  _PublicPolMapPageState createState() => _PublicPolMapPageState();
}

class _PublicPolMapPageState extends State<PublicPolMapPage> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  final Set<String> _favorites = Set<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa de Políticas Públicas'),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
      ),
      body: WebView(
      //initialUrl: 'https://www.google.com.hk',
        initialUrl: 'http://visaosinajuve.ibict.br/map/index.html',
        javaScriptMode: JavaScriptMode.unrestricted,
      ),
    );
  }
}