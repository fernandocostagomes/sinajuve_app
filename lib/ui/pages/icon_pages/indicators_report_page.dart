import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class IndicatorsReportPage extends StatefulWidget {
  @override
  _IndicatorsReportPageState createState() => _IndicatorsReportPageState();
}

class _IndicatorsReportPageState extends State<IndicatorsReportPage> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  final Set<String> _favorites = Set<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Relatório de Indicadores'),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
      ),
      body: WebView(
      //initialUrl: 'https://www.google.com.hk',
        initialUrl: 'http://indicadoressinajuve.ibict.br/map/index.html',
        javaScriptMode: JavaScriptMode.unrestricted,
      ),
    );
  }
}