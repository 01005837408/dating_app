import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/feature/chat/data/chat_cubit/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dating_app/core/api/api.dart';
import 'package:dating_app/core/modal/message_modal.dart';
import 'package:dating_app/feature/authentecation/model/user_model.dart';
import 'package:intl/intl.dart';

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

    // Fetch the user's profile picture
    final userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (userDoc.exists) {
      final profilePicture = userDoc['profilePicture'] ?? '';

      // Fetch the last message from the correct chat path
      var querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(Api.user.uid)  // Current user ID
          .collection('Chat')
          .doc(userId)  // Receiver's user ID
          .collection('Messages')
          .orderBy('data', descending: true)  // Order by the timestamp field (data in this case)
          .limit(1)  // Get the last message
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var lastMsgDoc = querySnapshot.docs.first;
        final lastMessage = lastMsgDoc['content'];  // Use the 'content' field for the message text
        final lastMessageTimeRaw = lastMsgDoc['data'];  // Use the 'data' field for the timestamp

        // Parse the string timestamp to DateTime
        DateTime lastMessageTime = DateTime.parse(lastMessageTimeRaw);

        // Format the time to show hours and minutes only
        String formattedTime = DateFormat('HH:mm a').format(lastMessageTime);

        emit(UserProfileAndLastMessageLoaded(profilePicture, lastMessage, formattedTime));
      } else {
        // No messages found
        emit(UserProfileAndLastMessageLoaded(profilePicture, '', ''));
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
        final users =
            snapshot!.docs.map((doc) => UserModel.fromMap(doc.data())).toList();
        emit(AllUsersLoaded(users));
      }, onError: (error) {
        emit(ChatError(error.toString()));
      });
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }
}
