import 'package:flutter/material.dart';
import 'package:minimalchatapp/pages/Register_page.dart';
import 'package:minimalchatapp/pages/login_page.dart';

class loginOrregister extends StatefulWidget {
  const loginOrregister({super.key});

  @override
  State<loginOrregister> createState() => _loginOrregisterState();
}

class _loginOrregisterState extends State<loginOrregister> {
  bool showlogin = true;
  void togglepages() {
    setState(() {
      showlogin = !showlogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showlogin) {
      return LoginPage(
        onTap: togglepages,
      );
    } else {
      return registerpage(
        onTap: togglepages,
      );
    }
  }
}
