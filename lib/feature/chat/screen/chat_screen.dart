import 'package:dating_app/feature/chat/data/chat_cubit/chat_cubit.dart';
import 'package:dating_app/feature/chat/data/chat_cubit/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dating_app/feature/chat/widget/message_card.dart';
import 'package:dating_app/core/modal/message_modal.dart';
import 'package:dating_app/feature/authentecation/model/user_model.dart';

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
            title: Text(user.fname),
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
                          return MessageCard(
                            message: state.messages[index],
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
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      decoration: const InputDecoration(
                        hintText: 'Type a message...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      final message = textController.text.trim();
                      if (message.isNotEmpty) {
                        newContext.read<ChatCubit>().sendMessage(message, user.uid);
                        textController.clear();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

