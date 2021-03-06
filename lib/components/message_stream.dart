import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'message_bubble.dart';

class MessageStream extends StatelessWidget {
  final _firestore = Firestore.instance;
  final FirebaseUser loggedInUser;

  MessageStream({this.loggedInUser});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: this
          ._firestore
          .collection('messages')
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        List<MessageBubble> messageBubbles = [];
        final messages = snapshot.data.documents;
        for (DocumentSnapshot message in messages) {
          String text = message.data['text'];
          String sender = message.data['sender'];
          messageBubbles.add(MessageBubble(
            text: text,
            sender: sender,
            isMe: sender == this.loggedInUser.email,
          ));
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}
