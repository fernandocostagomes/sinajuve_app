import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';

class ConnectivityInfra {
  bool hasConnection = false;
  Function callbackConnection;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  bool get isConnected {
    bool result = false;
    checkConnection().then((value) => result = value);
    return result;
  }

  initialize() async {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateStatus);
    await _connectivity.checkConnectivity();
    if (callbackConnection != null) callbackConnection();
  }

  Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch (_) {
      hasConnection = false;
    }

    return hasConnection;
  }

  void dispose() {
    _connectivitySubscription.cancel();
  }

  Future _updateStatus(ConnectivityResult connectivityResult) async {
    if (connectivityResult == ConnectivityResult.mobile) {
      //updateText("3G/4G");
    } else if (connectivityResult == ConnectivityResult.wifi) {

      //updateText("Wi-Fi\n$wifiName\n$wifiSsid\n$wifiIp");
    } else {
      //updateText("Não Conectado!");
    }

    if (callbackConnection != null) callbackConnection();
  }
}