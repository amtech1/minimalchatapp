import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:minimalchatapp/models/message.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  Future<void> sendMessage(String receiverID, message) async {
    final String currentuserID = _auth.currentUser!.uid;
    final String currentuserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();
    Message NewMessage = Message(
        senderId: currentuserID,
        senderEmail: currentuserEmail,
        receiverId: receiverID,
        message: message,
        timestamp: timestamp);

    List<String> ids = [currentuserID, receiverID];
    ids.sort();
    String chatRoomID = ids.join('_');

    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .add(NewMessage.toMap());
  }

  Stream<QuerySnapshot> getMessage(String userID, otheruserID) {
    List<String> ids = [userID, otheruserID];
    ids.sort();
    String chatRoomID = ids.join('_');
    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
