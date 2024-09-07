// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:dating_app/core/api/api.dart';
import 'package:dating_app/core/modal/message_modal.dart';
import 'package:dating_app/feature/authentecation/model/user_model.dart';
import 'package:dating_app/feature/chat/widget/user_profile.dart';
import 'package:dating_app/feature/home/presentation/widget/user_image.dart';
import 'package:dating_app/feature/profile_screen/date/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

class MessageCard extends StatefulWidget {
  MessageCard({super.key, required this.message  ,  required this.user});
  final MessageModel message;
  final UserModel user;

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  bool isArabic() {
    return Intl.getCurrentLocale() == "ar";
  }

  @override
  Widget build(BuildContext context) {
    // Determine if the current user is the sender or receiver
    return Api.user.uid == widget.message.senderId ? greenCard() : blueCard();
  }

  // Widget for messages sent by the current user (appears on the right)
  Widget greenCard() {
    return BlocProvider(
      create: (context) => ProfileCubit()..initialize(),
      child: Directionality(
        textDirection: isArabic() ? ui.TextDirection.rtl : ui.TextDirection.ltr,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              //  alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff424242)),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  color: const Color(0xff424242).withOpacity(0.2),
                ),
                child: Text(
                  widget.message.content,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            UserImage(),
            SizedBox(
              width: 4.w,
            ),
          ],
        ),
      ),
    );
  }

  // Widget for messages received from others (appears on the left)
  Widget blueCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         SizedBox(
          width: 4.w,
        ),
    UserProfile(
      user:widget.user ,
    ),
       
        Align(
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffeb7092).withOpacity(0.25)),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: const Color(0xffeb7092),
            ),
            child: Text(
              widget.message.content,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
