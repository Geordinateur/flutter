import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class AppValidator {

  final String validEmail = "emuricardo@gmail.com";
  static ProgressDialog? pd;

  static String? validateEmail(String? value) {
    if (!EmailValidator.validate(value ?? "")) {
      return "Entrez un email valide";
    } else if (value != "emuricardo@gmail.com") {
      return "Email incorrect";
    }
    return null;
  }

  static String? validePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Le mot de passe est requis";
    } else if (value != "123456") {
      return "Le mot de passe est incorrect";
    }
    return null;
  }

  static void showProgressDialog(BuildContext context, String message){
    pd = ProgressDialog(context: context);

    pd!.show(
        msg: message,
        barrierColor: Color(0x77000000),
        progressBgColor: Colors.transparent,
        elevation: 10.0
    );
  }

  static closeProgressDialog() {
    pd!.close();
  }

  static Future<void> showMyDialog(BuildContext context, String title, String message, {void Function()? callbackOk}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Valider'),
              onPressed: () {
                Navigator.of(context).pop();
                callbackOk!();
              },
            ),
          ],
        );
      },
    );
  }
}