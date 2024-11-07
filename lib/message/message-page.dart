import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tpx/message/message-list.dart';
import 'package:tpx/message/message-viewmodel.dart';

import 'message-card.dart';

class MessagePage extends StatelessWidget {
  void callAPI(BuildContext context) {
    // je récupère le view model
    //var viewModel = Provider.of<MessageViewModel>(context);
    var viewModel = context.read<MessageViewModel>();

    // j'appel la méthode d'un view model
    viewModel.callApi(context);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MessageViewModel(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Provider Page"),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                  onPressed: () {
                    callAPI(context);
                  },
                  child: Text("Rafraichir")),
              Expanded(
                child: Consumer<MessageViewModel>(
                    builder: (context, viewModel, child) {
                  //return MessageList(viewModel.messages);
                  return ListView.builder(
                      itemCount: viewModel.messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        // Récupérer les messages grace à l'index
                        var message = viewModel.messages[index];
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
                }),
              )
            ],
          ),
        );
      },
    );
  }
}
