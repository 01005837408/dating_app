import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dating_app/feature/chat/data/chat_cubit/chat_cubit.dart';
import 'package:dating_app/feature/chat/data/chat_cubit/chat_state.dart';
import 'package:dating_app/feature/authentecation/model/user_model.dart';
import 'package:dating_app/feature/chat/widget/chat_user_card.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});
  bool isArabic() {
    return Intl.getCurrentLocale() == "ar";
  }

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
          title: Text(
            S.of(context).chatTitle,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            if (state is ChatLoading) {
              return const Center(child: CircularProgressIndicator(
                color: AppColor.kPrimaryColor,
              ));
            } else if (state is AllUsersLoaded) {
              final users = state.users;

              return Directionality(
                textDirection:
                    isArabic() ? ui.TextDirection.rtl : ui.TextDirection.ltr,
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10,
                      top: 10,
                    ),
                    child: Card(
                        child: ChatUserCard(
                      user: users[index],
                      lastMessageTime: DateTime.now().toString(),
                    )),
                  ),
                ),
              );
            } else if (state is ChatError) {
              return  Center(
                child: Text(
                  'Error: {state.error}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 0.sp,
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
