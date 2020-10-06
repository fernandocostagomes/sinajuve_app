import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PublicPolSubPage extends StatefulWidget {
  @override
  _PublicPolSubPageState createState() => _PublicPolSubPageState();
}

class _PublicPolSubPageState extends State<PublicPolSubPage> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  final Set<String> _favorites = Set<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subsistema de Políticas Públicas'),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
      ),
      body: WebView(
      //initialUrl: 'https://www.google.com.hk',
        initialUrl: 'http://ppsinajuve.ibict.br/jspui',
        javaScriptMode: JavaScriptMode.unrestricted,
      ),
    );
  }
}