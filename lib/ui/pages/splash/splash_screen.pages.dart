import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sinajuve_app/ui/pages/home/home_page.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenPage extends StatefulWidget {
  SplashScreenPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 2,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFFFFFF8D), Color(0xFFFFFF8D)],
        ),
        navigateAfterSeconds: HomePage(),
        loaderColor: Colors.transparent,
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            scale: 0.1,
            image: AssetImage("assets/images/sinajuve_log_flat_2.png"),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    ],
  );
}
