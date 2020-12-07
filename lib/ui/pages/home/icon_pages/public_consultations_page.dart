import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PublicConsultationsPage extends StatefulWidget {
  @override
  _PublicConsultationsPageState createState() => _PublicConsultationsPageState();
}

class _PublicConsultationsPageState extends State<PublicConsultationsPage> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  final Set<String> _favorites = Set<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultas Públicas'),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
      ),
      body: WebView(
      //initialUrl: 'https://www.google.com.hk',
        initialUrl: 'http://sinajuve.ibict.br/consultas',
        javaScriptMode: JavaScriptMode.unrestricted,
      ),
    );
  }
}