import 'dart:io';


import 'package:dating_app/core/modal/message_modal.dart';
import 'package:dating_app/core/modal/user_modal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
class Api{
  static FirebaseAuth auth  = FirebaseAuth.instance ;
  static  FirebaseFirestore fireStore = FirebaseFirestore.instance ;
  static FirebaseStorage storage  =FirebaseStorage.instance ;
 static User get user => auth.currentUser! ;
 static  ChatUser?  me  ;
  static Future<bool> userExist()async{
   // ChatUser user ;
    return (await fireStore.collection("users").doc(user.uid).get()).exists ;

  }
  static Future<void> getSetInfo()async{
    // ChatUser user ;
    await fireStore.collection("users").doc(user.uid).get().then((user) async{
      if(user.exists){
       me = ChatUser.fromJson(user.data()!) ;
       print("Data is ${user.data()}") ;
      }else{
       await createUser().then((value) => getSetInfo());
      }
    });

  }
  static Future<void> createUser()async{
    final time = DateTime.now().millisecondsSinceEpoch.toString() ;
    ChatUser chatUser = ChatUser(
        image: user.photoURL.toString(),
        name: user.displayName.toString(),
        about: "user we chat ",
        createdAt: time,
        lastActive: time,
        id: user.uid,
        isOnline: false,
        pushToken: "",
        email: user.email.toString()
    ) ;
    return await fireStore.collection("users").doc(user.uid).set(chatUser.toJson()) ;

  }
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUser(){
    return fireStore.collection("users").where("id" , isEqualTo: user.uid).snapshots();
  }
  static Future<void> updateUserInfo()async{
    // ChatUser user ;
   await fireStore.collection("users").doc(user.uid).update({
     "name" :Api.me!.name,
     "about" :Api.me!.about,
   });

  }

  static Future<void> updateProfilePicture(File file)async{
    final ext = file.path.split(".").last ;
   final ref =  storage.ref().child("Profile_picture/${user.uid}.$ext") ;

   await ref.putFile(file , SettableMetadata(contentType: "image/$ext")).then((p0) {
     print("Date transfared : ${p0.bytesTransferred /1000 } kb");
   }) ;

   me!.image =await  ref.getDownloadURL() ;
  await  fireStore.collection("users").doc(user.uid).update({"image" : me!.image}) ;


  }


  ///****************************************************************************
  //   static String getConversationId(String id) => user.uid.hashCode <= id.hashCode ?
  //   "${user.uid} _ $id "
  //       : "${id} _ ${user.uid}" ;
  static String getConversationId(String id) {
    return user.uid.hashCode <= id.hashCode
        ? "${user.uid} _ $id"
        : "${id} _ ${user.uid}";
  }


  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages(ChatUser user) {
    return fireStore.collection("chats/${getConversationId(user.id)}/messages")
        .snapshots();
  }
  static Future<void> sendMessage(ChatUser chatUser , String msg) async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final Message  message =  Message(
        formId: user.uid,
        msg: msg,
        read: "",
        told: chatUser.id,
        type: Type.text,
        sent: DateTime.now().toIso8601String(),) ;
   print("Sending message: ${message.toJson()} to conversation: ${getConversationId(chatUser.id)}");
    final ref = fireStore.collection("chat /${getConversationId(chatUser.id,)}/messages");
    await ref.doc(time).set(message.toJson()) ;
    print("Message sent successfully");

  }


}