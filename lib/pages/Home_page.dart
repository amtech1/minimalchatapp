import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimalchatapp/Components/my_drawer.dart';
import 'package:minimalchatapp/Components/user_tile.dart';
import 'package:minimalchatapp/Services/Chat/chat_service.dart';
import 'package:minimalchatapp/Services/auth/auth_service.dart';
import 'package:minimalchatapp/pages/Chat_page.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("homepage"),
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
        stream: _chatService.getUsersStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return ListView(
            children: snapshot.data!
                .map<Widget>((userData) => builduserlistitem(userData, context))
                .toList(),
          );
        });
  }

  Widget builduserlistitem(
      Map<String, dynamic> userData, BuildContext context) {
    return UserTile(
        text: userData["email"],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                ReceiverEmail: userData["email"],
              ),
            ),
          );
        });
  }
}
