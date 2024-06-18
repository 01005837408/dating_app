import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:dating_app/core/utils/styles.dart';
import 'package:dating_app/core/widget/profile_image.dart';
import 'package:dating_app/feature/chat/presentation/screens/chat_message_screen/widget/chat_input_field.dart';
import 'package:dating_app/test_chat/widget/chat_list.dart';
import 'package:dating_app/test_chat/screens/home_chat.dart';
import 'package:flutter/material.dart';

import '../widget/chat_modal.dart';
class ChatScreen2 extends StatefulWidget {
  const ChatScreen2({super.key});

  @override
  State<ChatScreen2> createState() => _ChatScreen2State();
}

class _ChatScreen2State extends State<ChatScreen2> {

  final messageController = TextEditingController();
  String myName = "Chat2" ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.green,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  IconButton(onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeChat()));
                  },
                      icon: const Icon(
                        Icons.arrow_back, color: Colors.white, size: 24,)),
                  SizedBox(
                    width: 20,
                  ),
                  ProfileImage(),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text("محمد حسين", style: AppStyle.font17W400,),
                      Text("أخر ظهور 12.00 صباحا", style: AppStyle.font17W400.copyWith(fontSize: 12)),
                    ],
                  ),
                  Spacer(),
                  IconButton(onPressed: () {},
                      icon: const Icon(
                        Icons.menu, color: Colors.white, size: 24,)),
                ],

              ),
            ),

          ),
          Expanded(child: ListView.builder(
            itemCount: Chat.length,
            itemBuilder: (context, index) => BubbleSpecialThree(
              isSender: Chat[index].sender_name == myName ? true : false,
              text: Chat[index].text.toString(),
              color: Chat[index].sender_name == myName ? Colors.green :const Color(0xFF1B97F3),
              tail: Chat[index].sender_name == myName ?true : false,
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16
              ),
            ),)),
          Container(
            height: 100,

            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),


            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      style: TextStyle(
                        color: Colors.black,


                      ),
                    ),
                  ),
                  IconButton(onPressed: ()async {
                    setState(() {
                      Chat.add(ChatModal(messageController.text, myName));
                      messageController.text = "" ;
                    });
                  },
                      icon: Icon(Icons.send, color: Colors.green,)),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
