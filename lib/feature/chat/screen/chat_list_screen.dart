import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dating_app/feature/chat/data/chat_cubit/chat_cubit.dart';
import 'package:dating_app/feature/chat/data/chat_cubit/chat_state.dart';
import 'package:dating_app/feature/authentecation/model/user_model.dart';
import 'package:dating_app/feature/chat/widget/chat_user_card.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit()..fetchAllUsers(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home),
          ),
          title: const Text(
            "Chat app",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            if (state is ChatLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AllUsersLoaded) {
              final users = state.users;

              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) => ChatUserCard(user: users[index], lastMessageTime: '',),
              );
            } else if (state is ChatError) {
              return const Center(
                child: Text(
                  'Error: {state.error}',
                  style:  TextStyle(
                    color: Colors.black,
                    fontSize: 0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
            return const Center(child: Text('No data available'));
          },
        ),
      ),
    );
  }
}
