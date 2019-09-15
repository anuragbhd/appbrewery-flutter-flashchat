import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final String sender;

  MessageBubble({@required this.text, @required this.sender});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            this.sender,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 12.0,
            ),
          ),
          Material(
            color: Colors.lightBlueAccent,
            elevation: 5.0,
            borderRadius: BorderRadius.circular(30.0),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                this.text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
