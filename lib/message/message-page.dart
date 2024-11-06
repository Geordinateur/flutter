import 'package:flutter/material.dart';
import '../app-theme.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'message-list.dart';
import 'message.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: () {}, child: Text("CALL API")),
        Flexible(child: MessageList())
      ],
    );
  }
}
