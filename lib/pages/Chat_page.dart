import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String ReceiverEmail;
  const ChatPage({super.key, required this.ReceiverEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ReceiverEmail),
      ),
    );
  }
}
