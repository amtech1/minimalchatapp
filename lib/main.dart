import 'package:flutter/material.dart';
import 'package:minimalchatapp/pages/login_page.dart';
import 'package:minimalchatapp/themes/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter minimal chatapp',
      home: LoginPage(),
      theme: LightMode,
    );
  }
}
