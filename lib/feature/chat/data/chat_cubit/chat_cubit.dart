import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/feature/chat/data/chat_cubit/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dating_app/core/api/api.dart';
import 'package:dating_app/core/modal/message_modal.dart';
import 'package:dating_app/feature/authentecation/model/user_model.dart';


class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  void fetchMessages(String receiverId) async {
    try {
      emit(ChatLoading());

      final messagesStream = Api.getAllMessages(receiverId);

      messagesStream.listen((messages) {
        emit(ChatLoaded(messages));
      }, onError: (error) {
        emit(ChatError(error.toString()));
      });
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  void sendMessage(String message, String receiverId) async {
    try {
      await Api.sendMessage(msg: message, reciverId: receiverId);
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  void fetchUserProfileAndLastMessage(String userId) async {
    try {
      emit(ChatLoading());
      
      final userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
      if (userDoc.exists) {
        final profilePicture = userDoc['profilePicture'] ?? '';

        var querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('chats')
          .doc(userId)
          .collection('messages')
          .orderBy('timestamp', descending: true)
          .limit(1)
          .get();

        if (querySnapshot.docs.isNotEmpty) {
          var lastMsgDoc = querySnapshot.docs.first;
          final lastMessage = lastMsgDoc['content'];
          final lastMessageTime = lastMsgDoc['timestamp'].toDate().toString();

          emit(UserProfileAndLastMessageLoaded(profilePicture, lastMessage, lastMessageTime));
        } else {
          emit(UserProfileAndLastMessageLoaded(profilePicture, 'No messages yet', ''));
        }
      }
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  void fetchAllUsers() async {
    try {
      emit(ChatLoading());

      final userStream = Api.getAllUser();
      userStream.listen((snapshot) {
        final users = snapshot.docs
            .map((doc) => UserModel.fromMap(doc.data()))
            .toList();
        emit(AllUsersLoaded(users));
      }, onError: (error) {
        emit(ChatError(error.toString()));
      });
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }
}
