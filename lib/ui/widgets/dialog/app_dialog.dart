import 'package:flutter/material.dart';

class AppDialog {
  static showAlertDialogOK(BuildContext context,
      {bool showTitle = false, String title = '', @required Widget widget}) {
    //var okButton = getButton(textButton: 'Ok', actionButton: () {});

    AlertDialog alert = AlertDialog(
      title: showTitle ? Text(title) : Container(),
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.all(10),
      content:
          Container(color: Color(0xff81BB42).withOpacity(0.8), child: widget),
      backgroundColor: Colors.white,
      
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static showAlertDialogOkAndCancel(BuildContext context) {
    var cancelButton = getButton(textButton: 'Cancel', actionButton: () {});

    Widget continueButton =
        getButton(textButton: 'Continue', actionButton: () {});

    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text(
          "Would you like to continue learning how to use Flutter alerts?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static showAlertDialogYesAndNo(BuildContext context) {
    Widget yesButton = getButton(textButton: 'sim', actionButton: () {});
    Widget noButton = getButton(textButton: 'não', actionButton: () {});

    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text(
          "Would you like to continue learning how to use Flutter alerts?"),
      actions: [
        yesButton,
        noButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static FlatButton getButton(
      {@required String textButton, @required Function actionButton}) {
    return FlatButton(
      child: Text(textButton),
      onPressed: actionButton,
    );
  }
}
