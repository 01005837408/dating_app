// ignore_for_file: sized_box_for_whitespace

import 'package:dating_app/core/api/api.dart';
import 'package:dating_app/feature/chat/data/chat_cubit/chat_cubit.dart';
import 'package:dating_app/feature/chat/data/chat_cubit/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dating_app/feature/chat/widget/message_card.dart';
import 'package:dating_app/feature/authentecation/model/user_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatelessWidget {
  final UserModel user;
  final textController = TextEditingController();

  ChatScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChatCubit>(
      create: (context) => ChatCubit()..fetchMessages(user.uid),
      child: Builder(
        builder: (newContext) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            elevation: 3,
            //actions: [],
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
            title: Row(
              children: [
                UserProfile(user: user),
                
                  SizedBox(width: 20.h),
                Text(user.fname),
              ],
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: BlocBuilder<ChatCubit, ChatState>(
                  builder: (context, state) {
                    if (state is ChatLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ChatLoaded) {
                      return ListView.builder(
  reverse: true,
  itemCount: state.messages.length,
  itemBuilder: (context, index) {
    final message = state.messages[index];
    final isSender = Api.user.uid == message.senderId;

    return MessageCard(
      message: message,
      user: user,
   // Pass the correct user model
    );
  },
);

                    } else if (state is ChatError) {
                      return Center(child: Text(state.error));
                    } else {
                      return const Center(child: Text('Say Hi!'));
                    }
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Card(
                  color: Colors.white,
                  elevation: 3,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50.h,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0.0),
                            child: TextField(
                                controller: textController,
                                decoration: const InputDecoration(
                                  hintText: 'Type a message',
                                  border: InputBorder.none,
                                )),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.send,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          final message = textController.text.trim();
                          if (message.isNotEmpty) {
                            newContext
                                .read<ChatCubit>()
                                .sendMessage(message, user.uid);
                            textController.clear();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundImage: user.profilePicture.isNotEmpty
          ? NetworkImage(user.profilePicture)
          : const AssetImage('assets/images/Home Screen-image.jpg')
              as ImageProvider,
    );
  }
}
