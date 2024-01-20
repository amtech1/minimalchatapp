import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String message;
  final Timestamp timestamp;

  Message({
    required this.senderId,
    required this.senderEmail,
    required this.receiverId,
    required this.message,
    required this.timestamp,
  });

  // Update the toMap method
  Map<String, dynamic> toMap(
      {String? senderId,
      String? senderEmail,
      String? receiverId,
      String? message,
      Timestamp? timestamp}) {
    return {
      'senderId': senderId ?? this.senderId,
      'senderEmail': senderEmail ?? this.senderEmail,
      'receiverId': receiverId ?? this.receiverId,
      'message': message ?? this.message,
      'timestamp': timestamp ?? this.timestamp,
    };
  }

  // Add a factory method to construct a Message object from a map
  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      senderId: map['senderId'],
      senderEmail: map['senderEmail'],
      receiverId: map['receiverId'],
      message: map['message'],
      timestamp: map['timestamp'],
    );
  }
}
