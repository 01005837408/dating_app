import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/core/utils/assets.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/utils/styles.dart';
import 'package:dating_app/core/widget/profile_image.dart';
import 'package:dating_app/feature/chat/data/chat_message_modal/chat_message_modal.dart';
import 'package:dating_app/feature/chat/presentation/screens/chat_message_screen/widget/message_design.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'widget/chat_input_field.dart';

class ChatMessageScreen extends StatelessWidget {
   ChatMessageScreen({super.key});
  List<ChatMessageModal> chatMessages= [] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Container(
              color: Colors.green,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    IconButton(onPressed: () {
                      Navigator.pop(context);
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
            SizedBox(height: 10,),
            Expanded(
                child:StreamBuilder<QuerySnapshot<Map>>(
                  stream: FirebaseFirestore.instance.collection('messages')
                      .orderBy(descending: false , "time").snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.data!.size <= 0) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('No messages found.'));
                    }
                    final snapShotDate = snapshot!.data ;
                    final snapShotDateSize = snapShotDate!.size;

                    final user = FirebaseAuth.instance.currentUser;
                    List<ChatMessageModal> chatMessage = [];
                    if(user == null){
                      print("user not Authentecated") ;
                      Navigator.pop(context);
                    }
                    snapshot.data!.docs.forEach((element) {
                      final data = element.data();
                      ChatMessageType type ;
                      ChatMessageModal message;
                      final senderId = data["senderId"];
                      if(data["type"] == 1){
                        type= ChatMessageType.image;
                      message =   ChatMessageModal(
                            messageState: ChatMessageState.viewed ,
                            massageType: ChatMessageType.image,
                            isSender: user!.uid == senderId,
                          senderImage: data["senderImage"],
                          sender: data["senderName"],
                          imageUrl: data["image"],
                        );

                      } else{
                        type= ChatMessageType.text;
                        message=   ChatMessageModal(
                          messageState: ChatMessageState.viewed ,
                          massageType: ChatMessageType.image,
                          isSender: user!.uid == senderId,
                          senderImage: data["senderImage"],
                          sender: data["senderName"],
                          text: data["message"],
                        );
                      }

                      chatMessages.add(message) ;
                    });



                    return ListView.builder(
                      itemCount: chatMessages.length,
                      itemBuilder: (context, index) => MessageSesign(
                          message: chatMessages[index],
                          index: index
                      )
                    );
                  },
                ),
            ),
            ChatInputField(),

          ],
        ),
      ),

    );
  }

}



