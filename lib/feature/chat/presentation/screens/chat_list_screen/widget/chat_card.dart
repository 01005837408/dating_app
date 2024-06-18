import 'package:dating_app/feature/chat/data/chat_list_modal/chat_list_modal.dart';

import 'package:dating_app/feature/chat/presentation/screens/chat_list_screen/chat_list_screen.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
   ChatCard({
     super.key,
     required this.press,
     required this.chat
   });
    ChatModal chat ;
    VoidCallback press ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(chat.image)
                ),
             //  if(chat.isActive)
                  Positioned(

                    bottom: 0,
                    right: 0,

                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                SizedBox(width: 10,),


              ],

            ),
            SizedBox(width: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(chat.name , overflow: TextOverflow.ellipsis,maxLines: 1,style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),),
                Text(chat.lastMessage , overflow: TextOverflow.ellipsis,style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                  fontWeight: FontWeight.w400,

                  overflow: TextOverflow.ellipsis
                ),),
              ],
            ),
            Spacer(),
            Text(chat.time ,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14,
                fontWeight: FontWeight.w400,

               // overflow: TextOverflow.ellipsis
            ),),

          ],
        ),
      ),
    );
  }
}
