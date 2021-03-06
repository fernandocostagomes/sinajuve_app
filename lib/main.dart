import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';

import 'ui/pages/splash/splash_screen.pages.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sinajuve",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amber[200],
      ),
      initialRoute:'home',
      routes: {
        'home': (BuildContext context) => SplashScreenPage(title: 'SplashScreenFlutter'),
      },

//      home: SplashScreenPage(title: 'SplashScreenFlutter'),
    );
  }
}
