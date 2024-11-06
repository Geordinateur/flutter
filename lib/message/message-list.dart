import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'message.dart';

class MessageList extends StatefulWidget {
  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  List<Message> messages = [];

  void callApi(BuildContext context) async {
    // 1 :: Appel l'url
    var responseHttp = await http.get(Uri.parse(
        "https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/movies.json"));

    print(responseHttp.body);

    // 2 :: Transformer la réponse Http en JSON
    var responseBodyJson = convert.jsonDecode(responseHttp.body);

    setState(() {
      // 3 :: Convertir un liste d'article
      messages = List<Message>.from(responseBodyJson
          .map((messageJson) => Message.fromJson(messageJson))
          .toList());

      print(messages);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            itemCount: messages.length,
            itemBuilder: (BuildContext context, int index) {
              // Récupérer les messages grace à l'index
              var message = messages[index];
              return Text("Id: ${message.id} - Titre : ${message.message}");
            });
  }
}
