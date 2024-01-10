import 'package:flutter/material.dart';
import 'package:minimalchatapp/Components/my_drawer.dart';
import 'package:minimalchatapp/auth/auth_service.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("homepage"),
      ),
      drawer: MyDrawer(),
    );
  }
}
