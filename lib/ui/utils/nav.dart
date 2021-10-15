import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future push(BuildContext context, Widget page, {bool replace = false}) {

  if(replace) {
    return Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  }

  return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
}

bool pop<T extends Object>(BuildContext context, [ T result ]) {
  if(Navigator.canPop(context)) {
    Navigator.pop(context);
    return true;
  }
  return false;
}

abrirUrl(url) async {
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: false);
  } else {
    throw 'Could not launch $url';
  }
}