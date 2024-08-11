// import 'dart:io';

// import 'package:dating_app/core/modal/sign_up_user_modal.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// class UserApi {
//   static FirebaseAuth auth  = FirebaseAuth.instance ;
//   static  FirebaseFirestore fireStore = FirebaseFirestore.instance ;
//   static FirebaseStorage storage  =FirebaseStorage.instance ;
//  static User get user => auth.currentUser! ;
//  static SignUpUserModal? me2 ;
//  //////////////////////////////////////////////////////////////////////////////////////////
//    static Future<bool> userExist()async{  // check user exist or not 
  
//     return (await fireStore.collection("users").doc(user.uid).get()).exists ;

//   }
//   ////////////////////////////////////////////////////////////////////////////////////////
// static Future<void> getSetInfo()async{
//     // ChatUser user ;
//     await fireStore.collection("users").doc(user.uid).get().then((user) async{
//       if(user.exists){
//        me2 = SignUpUserModal.fromJson(user.data()!) ;
//        print("Data is ${user.data()}") ;
//       }else{
//        await createUser().then((value) => getSetInfo());
//       }
//     });
//   }
//   //////////////////////////////////////////////////////////////////////////////////////
//    static Future<void> createUser()async{
//     final time = DateTime.now().millisecondsSinceEpoch.toString() ;
//     SignUpUserModal userModal = SignUpUserModal (
//       fName: user.displayName.toString(),
//       lName: user.displayName.toString(),
//       email: user.email.toString(),
//       id: user.uid,
//     ) ;
//     return await fireStore.collection("users").doc(user.uid).set(userModal.toJson()) ;

//   }
//    static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUser(){
//     return fireStore.collection("users").where("id" , isEqualTo: user.uid).snapshots();
//   }
//   static void createUserData(SignUpUserModal user)async{

//     await fireStore.collection("users").add(user.toJson()); 

//   }
// }