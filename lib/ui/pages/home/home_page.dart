import 'package:flutter/material.dart';
import 'package:sinajuve_app/ui/pages/home/body_home.dart';
import 'package:sinajuve_app/ui/widgets/drawer/drawer_list.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/sinajuve_log_flat_2.png",
              fit: BoxFit.contain,
              height: 80,
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: body_home(context),
      ),
      drawer: DrawerList(),
    );
  }
}