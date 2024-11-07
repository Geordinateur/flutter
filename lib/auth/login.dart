import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tpx/app-validator.dart';
import '../app-theme.dart';
import 'auth-viewmodel.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void callApi(BuildContext context) async {
    // Récupérer la saisie
    String email = emailController.text;
    String password = passwordController.text;

    // Appeler le viewmodel
    context.read<AuthViewModel>().callApi(context, email, password);
  }

  void onSubmit(BuildContext context) {
    /*
    if (_key.currentState!.validate()){
      // Changer de page
      Navigator.pushNamed(context, "/message");
    }
    */
    callApi(context);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthViewModel(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Login"),
            centerTitle: true,
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
                child: Form(
                  key: _formKey,
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
                          style:
                              TextStyle(fontSize: 26, color: Color(0xDDFFFFFF)),
                        ),
                      ),
                      AppTheme.wrapField(TextFormField(
                        controller: emailController,
                        validator: AppValidator.validateEmail,
                        decoration: AppTheme.appTextField(
                            "Email", "Veuillez saisir un Email"),
                      )),
                      AppTheme.wrapField(TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        validator: AppValidator.validePassword,
                        decoration: AppTheme.appTextField(
                            "Mot de passe", "Veuillez saisir un mot de passe"),
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
                ),
              )
            ],
          ),
        );
      },
    );
  }
}