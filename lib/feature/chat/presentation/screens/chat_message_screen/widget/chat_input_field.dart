import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/feature/chat/data/chat_message_modal/chat_message_modal.dart';
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
                  Expanded(child: TextField(
                  controller: messageController,
                    decoration:const InputDecoration(
                      hintText: "أدخل الرساله",
                      border: InputBorder.none,
                    ),

                  )),
                  messageController.text.isEmpty ?
                      Row(
                        children: [
                          IconButton(onPressed: () async{
                            XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
                            print(file!.path);
                            final message = ChatMessageModal(
                                messageState: ChatMessageState.viewed,
                                massageType: ChatMessageType.image,
                                isSender: true,
                              imageUrl: file.path,
                            );

                            final ref = storage.ref()
                                .child("images")
                                .child(DateTime.now().toIso8601String() + file.name);
                            await ref.putFile(File(file.path));
                            final url = await ref.getDownloadURL();
                            print(url.toString());


                            Map<String , dynamic> document =  {
                              "image" : url,

                              "senderId" : user!.uid,
                              "sendName" : user!.displayName,
                              "senderImage" :user!.photoURL,
                              "type" : 1,
                              "time" : DateTime.now(),

                            };
                            firStore.collection("messages").add(document) ;
                            setState(() {
                              messageController.clear();
                            });

                          },
                              icon: Icon(Icons.camera_alt_outlined)),
                          //SizedBox(width: 10,),
                          IconButton(onPressed: ()async{
                            XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
                            print(file!.path);
                            final message = ChatMessageModal(
                              messageState: ChatMessageState.viewed,
                              massageType: ChatMessageType.image,
                              isSender: true,
                              imageUrl: file.path,
                            );

                            final ref = storage.ref()
                                .child("images")
                                .child(DateTime.now().toIso8601String() + file.name);
                            await ref.putFile(File(file.path));
                            final url = await ref.getDownloadURL();
                            print(url.toString());


                            Map<String , dynamic> document =  {
                              "image" : url,

                              "senderId" : user!.uid,
                              "sendName" : user!.displayName,
                              "senderImage" :user!.photoURL,
                              "type" : 1,
                              "time" : DateTime.now(),

                            };
                            firStore.collection("messages").add(document) ;
                            setState(() {
                              messageController.clear();
                            });
                          },
                              icon: Icon(Icons.attach_file_outlined)),

                        ],
                      ): IconButton(onPressed: ()async {
                        final user = FirebaseAuth.instance.currentUser;
                        final message = messageController.text;
                        print(message);
                        final messageDoc = {
                          "message" : message,
                          "id" :user!.uid,
                          "sender" :user!.displayName,
                          "time" :DateTime.now(),
                        };
                        final doc = FirebaseFirestore.instance
                            .collection("messages").add(messageDoc);
                        setState(() {
                          messageDoc.clear();
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
