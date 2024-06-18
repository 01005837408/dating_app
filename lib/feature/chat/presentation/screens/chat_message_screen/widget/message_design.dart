import 'package:dating_app/core/utils/assets.dart';
import 'package:dating_app/feature/chat/data/chat_message_modal/chat_message_modal.dart';
import 'package:dating_app/feature/chat/presentation/screens/chat_message_screen/widget/message_image_design.dart';
import 'package:dating_app/feature/chat/presentation/screens/chat_message_screen/widget/message_text_design.dart';
import 'package:flutter/material.dart';

class MessageSesign extends StatelessWidget {
   MessageSesign({
     super.key,
     required this.message,
     required this.index,
   });
  ChatMessageModal message;
  final int index ;

  @override
  Widget build(BuildContext context) {
    Widget messageContain( ChatMessageModal message , int index){
      switch (message.massageType){
        case ChatMessageType.text:
          return MessageTextDesign(message:message);

        case ChatMessageType.image:
          return MessageImageDesign(message:message ,index:index ,);

        default:
          return Center(child: CircularProgressIndicator());
      // TODO: Handle this case.

      }

      };
    return Container(
      child: Column(
        mainAxisAlignment: message.isSender ? MainAxisAlignment.end :
        MainAxisAlignment.start,
        children: [

          if(!message.isSender) ...[  // To Put Widget in if statement
            CircleAvatar(
              radius: 20,
              child: Image.asset(Assets.profileImage, ),
            ),
            SizedBox(width: 10,),

          ],
          messageContain(message, index)

        ],
      ),
    );
  }
}
