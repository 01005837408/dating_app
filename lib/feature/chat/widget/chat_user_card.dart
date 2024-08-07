
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/core/modal/user_modal.dart';
import 'package:dating_app/feature/chat/screen/chat_screen.dart';

import 'package:flutter/material.dart';

class ChatUserCard extends StatefulWidget {
   ChatUserCard({super.key , required this.user});
  ChatUser user ;

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (_) =>ChatScreen(
            user :widget.user,
          ))) ;
        },
        child: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius:BorderRadius.circular(20) ,
                child: CachedNetworkImage(
                  width: 30,
                  height: 30,
                  imageUrl:widget.user.image,
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.person),
                ),
              ),
              title: Text(widget.user.name , style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20
              ),),
              subtitle: Text(widget.user.about ,maxLines: 1, style: const TextStyle(
                  color: Colors.black54,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
              ),),
              trailing:Container(width: 15, height: 15 , decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(10),
              ),)

            ),
          ),
        ),
      ),
    );
  }
}
