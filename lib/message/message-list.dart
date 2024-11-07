import 'package:flutter/material.dart';
import 'message-card.dart';
import 'message.dart';

class MessageList extends StatelessWidget {
  MessageList(List<Message> messages);

  List<Message> messages = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          // Récupérer les messages grace à l'index
          var message = messages[index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(
              15.0,
              0,
              15.0,
              15.0,
            ),
            child: MessageCard(message),
          );
        });
  }
}
