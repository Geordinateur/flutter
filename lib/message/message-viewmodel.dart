import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:tpx/app-validator.dart';
import 'message.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MessageViewModel with ChangeNotifier {

  List<Message> messages = [];

  void callApi(BuildContext context) async {

  AppValidator.showProgressDialog(context, "Récupération des messages");
    try {
      // 1. Appeler l'URL et vérifier le code de statut
      var responseHttp = await http.get(Uri.parse(
        "https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/tweets.json"));

      if (responseHttp.statusCode == 200) {
        // 2. Transformer la réponse HTTP en JSON
        var responseBodyJson = convert.jsonDecode(responseHttp.body);

        // 3. Convertir en une liste de messages
        messages = List<Message>.from(responseBodyJson
            .map((messageJson) => Message.fromJson(messageJson))
            .toList());

        // Fermer l'ecran de chargement
        AppValidator.closeProgressDialog();

        // Notifier les listeners après la mise à jour
        notifyListeners();
      } else {
        // Afficher un message d'erreur si le code de statut n'est pas 200
        print("Erreur: ${responseHttp.statusCode}");
      }
    } catch (e) {
      // Gérer les erreurs d'exception réseau ou de décodage JSON
      print("Erreur lors de l'appel de l'API: $e");
    }
  }
}
