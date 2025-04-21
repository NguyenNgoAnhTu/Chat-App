import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatService {
  // get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

  // get message
}
