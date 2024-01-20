import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minimalchatapp/Components/chat_bubble.dart';
import 'package:minimalchatapp/Components/my_textfield.dart';
import 'package:minimalchatapp/Services/Chat/chat_service.dart';
import 'package:minimalchatapp/Services/auth/auth_service.dart';

class ChatPage extends StatelessWidget {
  final String ReceiverEmail;
  final String receiverID;
  ChatPage({super.key, required this.ReceiverEmail, required this.receiverID});
  final TextEditingController _messagecontroller = TextEditingController();
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();
  void sendMessage() async {
    if (_messagecontroller.text.isNotEmpty) {
      await _chatService.sendMessage(receiverID, _messagecontroller.text);
      _messagecontroller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ReceiverEmail),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          children: [Expanded(child: _buildmessagelist()), _builduserinput()],
        ),
      ),
    );
  }

  Widget _buildmessagelist() {
    String senderId = _authService.getcurrentuser()!.uid;
    return StreamBuilder(
        stream: _chatService.getMessage(receiverID, senderId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("loading");
          }
          return ListView(
            children: snapshot.data!.docs
                .map((doc) => _buildmessageitem(doc))
                .toList(),
          );
        });
  }

  Widget _buildmessageitem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    bool iscurrentuser =
        data['senderEmail'] == _authService.getcurrentuser()!.email;
    var alignment =
        iscurrentuser ? Alignment.centerRight : Alignment.centerLeft;
    return Container(
        child: Column(
      crossAxisAlignment:
          iscurrentuser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        ChatBubble(iscurrentuser: iscurrentuser, message: data['message'])
      ],
    ));
  }

  Widget _builduserinput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Expanded(
              child: MyTextField(
                  hinttext: "type message",
                  obscureText: false,
                  controller: _messagecontroller)),
          Container(
              decoration:
                  BoxDecoration(color: Colors.green, shape: BoxShape.circle),
              margin: EdgeInsets.only(right: 25),
              child: IconButton(
                  onPressed: sendMessage,
                  icon: Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                  )))
        ],
      ),
    );
  }
}
