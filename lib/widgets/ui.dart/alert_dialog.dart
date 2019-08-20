import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../../res/dimens.dart' as dimens;
import '../../res/strings.dart' as strings;

class CustomAlertDialog {
  final String title;
  final String firstBtnText;
  final String secondBtnText;
  final Function cancelAction;
  final Function confirmAction;

  CustomAlertDialog(
      {this.title,
      this.firstBtnText,
      this.secondBtnText,
      this.cancelAction,
      this.confirmAction});

  Future<bool> show(BuildContext context) async {
    bool isConfirmed = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(dimens.dialogCornerRadius),
              ),
            ),
            title: Text(strings.confirmDelete(title)),
            actions: <Widget>[
              FlatButton(
                  child: Text(firstBtnText),
                  onPressed: () {
                    cancelAction();
                    return true;
                  }),
              FlatButton(
                  child: Text(secondBtnText),
                  textColor: Colors.red,
                  onPressed: () {
                    confirmAction();
                    return false;
                  })
            ],
          );
        });
    return isConfirmed;
  }
}
