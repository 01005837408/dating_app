import 'package:dating_app/core/api/api.dart';
import 'package:dating_app/core/modal/message_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatefulWidget {
  MessageCard({super.key, required this.message});
  final MessageModel message;

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    // Determine if the current user is the sender or receiver
    return Api.user.uid == widget.message.senderId ? greenCard() : blueCard();
  }

  // Widget for messages sent by the current user (appears on the right)
  Widget greenCard() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          color: Colors.greenAccent,
        ),
        child: Text(
          widget.message.content,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  // Widget for messages received from others (appears on the left)
  Widget blueCard() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: Colors.blueAccent,
        ),
        child: Text(
          widget.message.content,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
