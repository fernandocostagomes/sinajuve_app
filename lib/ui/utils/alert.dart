import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

_onClickDialog(BuildContext context, text){
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: ()async => false,
        child: AlertDialog(
          title: Text(text),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("Ok"),
              onPressed: (){
                Navigator.pop(context);
                print("Ok!!!");
              },
            )
          ],
        ),
      );
    }
  );
}