import 'package:dating_app/feature/chat/data/chat_message_modal/chat_message_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageTextDesign extends StatelessWidget {
  MessageTextDesign({super.key , required this.message});
  ChatMessageModal message ;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.green[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         !(message.isSender ) ?
           const Text("message.tex", style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 14,

          ),) :
              const SizedBox(height: 5,),
          Text(message.text , style: TextStyle(
            color: message.isSender ? Colors.white : Colors.black,
          ),)
        ],
      ),
    );
  }
}
