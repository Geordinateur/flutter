import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:tpx/app-validator.dart';

class AuthViewModel with ChangeNotifier {

  void callApi(BuildContext context, String email, String password) async {

    // Affiche l'ecran de chargement
    AppValidator.showProgressDialog(context, "Tentative de connexion...");

    // Simuler 1 seconde d'attente
    await Future.delayed(Duration(seconds: 1));

    // Le header application/json
    final headers = {'Content-Type': 'application/json'};

    // Preparer la requête (email / password)
    final bodyRequest = convert.jsonEncode(
        {'email': email, 'password': password});

    // Appeler l'api
    var responseHttp = await http.post(Uri.parse("http://localhost:3000/login"),
        headers: headers, body: bodyRequest);

    // Récupérer la rep http en json
    var responseBodyJson = convert.jsonDecode(responseHttp.body);

    // Fermer l'ecran de chargement
    AppValidator.closeProgressDialog();

    // Si ok
    if (responseBodyJson["code"] == "200"){
      AppValidator.showMyDialog(context, "Authentification", responseBodyJson["message"], callbackOk: (){Navigator.pushNamed(context, "/message");});
      //Navigator.pushNamed(context, "/message");
      // Todo stocker le token quelque part
      // Proposition : le mettre dans un static
    }
    // Si pas ok
    else {
      AppValidator.showMyDialog(context, "Authentification", responseBodyJson["message"]);
      // Message d'erreur
      print(responseBodyJson);
    }
  }

}