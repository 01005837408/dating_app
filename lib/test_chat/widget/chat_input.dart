import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/feature/chat/data/chat_message_modal/chat_message_modal.dart';
import 'package:dating_app/test_chat/widget/chat_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatInputField extends StatefulWidget {
  ChatInputField({super.key});

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final messageController = TextEditingController();
   void initState(){
    messageController.addListener(() {
      setState(() {

      });
    });

  }
  final storage = FirebaseStorage.instance;
  final firStore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Container(
     // height: 100,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.green,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            color: Colors.green.withOpacity(.08),
            blurRadius: 32,
          ),

        ],

      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 100,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  IconButton(onPressed: (){},
                      icon:const Icon(Icons.sentiment_satisfied_alt_outlined)),
                  SizedBox(width: 6,),
                  TextField(
                    controller: messageController,
                    decoration:const InputDecoration(
                      hintText: "أدخل الرساله",
                      border: InputBorder.none,
                    ),

                  ),
                  IconButton(onPressed: ()async {
                    setState(() {
                      Chat.add(messageController.text);
                      messageController.text = "" ;
                    });
                  },
                      icon: Icon(Icons.send, color: Colors.green,)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
