import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minimalchatapp/auth/auth_gate.dart';
import 'package:minimalchatapp/firebase_options.dart';
import 'package:minimalchatapp/pages/login_page.dart';
import 'package:minimalchatapp/themes/light_mode.dart';

import 'auth/login_or_register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter minimal chatapp',
      home: AuthGate(),
      theme: LightMode,
    );
  }
}
