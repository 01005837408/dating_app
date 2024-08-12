import 'package:dating_app/core/modal/message_modal.dart';
import 'package:dating_app/feature/authentecation/model/user_model.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<MessageModel> messages;

  ChatLoaded(this.messages);
}

class ChatError extends ChatState {
  final String error;

  ChatError(this.error);
}

class UserProfileAndLastMessageLoaded extends ChatState {
  final String profilePicture;
  final String lastMessage;
  final String lastMessageTime;

  UserProfileAndLastMessageLoaded(this.profilePicture, this.lastMessage, this.lastMessageTime);
}

class AllUsersLoaded extends ChatState {
  final List<UserModel> users;

  AllUsersLoaded(this.users);
}
