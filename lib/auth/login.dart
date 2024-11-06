import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:tpx/app-validator.dart';

import '../app-theme.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final String validPassword = "123456";

void onSubmit(BuildContext context) {
  if (_formKey.currentState!.validate()) {
    Navigator.pushNamed(context, "/home");
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "mobile_background.jpg",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(60),
            child: Column(
              children: [
                Spacer(flex: 2),
                Image.asset(
                  "sign_in_icon.png",
                  width: 126,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Connexion",
                    style: TextStyle(fontSize: 26, color: Color(0xDDFFFFFF)),
                  ),
                ),
                Form(
                  child: Column(
                    children: [
                      AppTheme.wrapField(TextFormField(
                          decoration: AppTheme.appTextField(
                              "Email", "Veuillez saisir votre email"),
                          validator: AppValidator.validateEmail)),
                      AppTheme.wrapField(TextFormField(
                        decoration: AppTheme.appTextField(
                            "Password", "Veuillez saisir votre mot de passe"),
                        obscureText: true,
                        validator: AppValidator.validePassword,
                      )),
                      AppTheme.wrapField(Row(
                        children: [
                          Switch(value: false, onChanged: (value) => {}),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("Memoriser mes informations",
                                style: TextStyle(color: Color(0xDDFFFFFF))),
                          )
                        ],
                      )),
                    ],
                  ),
                  key: _formKey,
                ),
                Spacer(flex: 1),
                AppTheme.wrapField(
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            onSubmit(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text("Connexion"),
                          ))),
                ),
                Spacer(flex: 6),
              ],
            ),
          )
        ],
      ),
    );
  }
}
