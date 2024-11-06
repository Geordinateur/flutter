import 'package:flutter/material.dart';
import 'package:tpx/app-theme.dart';
import 'footer.dart';
import 'header.dart';
import 'message/message-page.dart';
import 'message/message-list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Message"),
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("background.jpg"),
            fit: BoxFit.cover,
          ),
        ),


        child: Column(
          children: [
            Header(),
            Expanded(child: MessagePage()),
            HomePageFooter()
          ],
        ),
      ),
    );
  }
}