import 'package:chat_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatService {
  // get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //get user stream
  /*
    List<Map<String,dynamic> =
    [
      {
      'email' : anhtu113kx@gmail.com
      'id': ...
      },
      {
      'email' : nguyenthithanhmy@gmail.com
      'id': ...
      },
    ]
   */
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        // go through each individual user
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  //send message
  Future<void> sendMessage(String receiveID, message) async {
    //get current info
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();
    //create a new message
    Message newMessage = Message(
      senderID: currentUserID,
      senderEmail: currentUserEmail,
      receiverID: receiveID,
      message: message,
      timestamp: timestamp,
    );
    // constructor chat room ID for the two users
    List<String> ids = [currentUserID, receiveID];
    ids.sort(); // sort the ids(this ensure chatroomID is same for any 2 people)
    String chatRoomID = ids.join('_');

    // add new message to database

    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("message")
        .add(newMessage.toMap());
  }

  // get message
  Stream<QuerySnapshot> getMessages(String userId, otherUserID) {
    // constructor a chatroom ID for the two users
    List<String> ids = [userId, otherUserID];
    ids.sort();
    String chatroomID = ids.join("_");
    return _firestore
        .collection("chat_rooms")
        .doc(chatroomID)
        .collection("message")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
