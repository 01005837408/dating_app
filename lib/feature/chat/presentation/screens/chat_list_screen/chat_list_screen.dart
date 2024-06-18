import 'package:dating_app/core/utils/assets.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/utils/styles.dart';
import 'package:dating_app/core/widget/profile_image.dart';
import 'package:dating_app/feature/chat/data/chat_list_modal/chat_list_modal.dart';
import 'package:dating_app/feature/chat/presentation/screens/chat_message_screen/chat_message_screen.dart';


import 'package:flutter/material.dart';

import 'widget/chat_card.dart';
import 'widget/fill_out_line_button.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Container(
                     color: Colors.greenAccent,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    filledOutLineButton(
                      text: "اخر الرسائل ",
                      isFilled: true,
                      press: (){},
                    ),
                    SizedBox(width: 30,),
                    filledOutLineButton(
                      text: "نشط ",
                      isFilled: false,
                      press: (){},
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
                  itemCount: listOfChat.length,
                    physics: BouncingScrollPhysics(),

                    itemBuilder: (context, index)=>ChatCard(
              press: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatMessageScreen()));
              },
              chat: listOfChat[index]
            )
            ))
          ],
        ),
      ),
    );
  }
  AppBar buildAppBar( ){
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColor.kPrimaryColor,
      leading:  const Padding(
        padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 6.0),
        child: ProfileImage(),
      ),
      title: Text("الرسائل" , style: AppStyle.font21bold,),
    );
  }

}

