import 'package:dating_app/test_chat/models/user_modal.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatModal {
  String id;
  List<UserModal> users = [];
  List userId = [];
  List chat = [];
  ChatModal(
      {required this.chat,
      required this.id,
      required this.users,
      required this.userId});

  // ChatModal.from_json(map)
  //     : this(
  //           id: map["id"],
  //           chat: map["chat"],
  //           userId: map["userId"],
  //           users: map["users"]
  //               .map<UserModal>((e) => UserInfo.from_json(e).toList()));
  //               to_json(){
  //                 return {
  //                   'id':id,
  //                    'chat':chat,
  //                     'userId':userId,
  //                     "users" : users.map((e) => e.to_json()).toList()

  //                 }
  //               }
}
