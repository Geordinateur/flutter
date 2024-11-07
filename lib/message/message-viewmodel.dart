import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:tpx/app-validator.dart';
import 'message.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MessageViewModel with ChangeNotifier {
  List<Message> messages = [];

// Crée une instance de stockage sécurisé
  final storage = FlutterSecureStorage();

  void callApi(BuildContext context) async {
    // 1. Lire le jeton depuis le stockage sécurisé
    String? token = await storage.read(key: 'jwt');

    AppValidator.showProgressDialog(context, "Récupération des messages");
    try {
      print(token);
      var headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      // 1. Appeler l'URL et vérifier le code de statut
      var responseHttp = await http
          .get(Uri.parse("http://localhost:3000/messages"), headers: headers);

      if (responseHttp.statusCode == 200) {
        // 2. Transformer la réponse HTTP en JSON
        var responseBodyJson = convert.jsonDecode(responseHttp.body);

        if (responseBodyJson["code"] == "200") {
          // 3. Convertir en une liste de messages
          messages = List<Message>.from(responseBodyJson["data"]
              .map((messageJson) => Message.fromJson(messageJson))
              .toList());
          // Fermer l'ecran de chargement
          AppValidator.closeProgressDialog();
        } else {
          // Fermer l'ecran de chargement
          AppValidator.closeProgressDialog();
          AppValidator.showMyDialog(
              context, "Erreur", responseBodyJson["message"]);
        }

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
