import 'package:flutter/material.dart';
import 'message/message-page.dart';
import 'auth/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/login",
      routes: {
        "/" : (context) => MessagePage(),
        '/login' : (context) => LoginPage(),
        '/home' : (context) => MessagePage(),
      },
    );
  }
}
