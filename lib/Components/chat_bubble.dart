import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final bool iscurrentuser;
  final String message;
  const ChatBubble(
      {super.key, required this.iscurrentuser, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: iscurrentuser ? Colors.green : Colors.grey.shade500,
          borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
