
import 'package:dating_app/core/modal/user_modal.dart';
import 'package:flutter/material.dart';



class ChatInput extends StatelessWidget {
   ChatInput( this.user ,{
    super.key,
  });
  final textController = TextEditingController() ;
   ChatUser user ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10,),
        Expanded(
          child: Card(
            child: Row(

              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context) ;
                },
                    icon: Icon(Icons.emoji_emotions , color: Colors.blueAccent,)),
                 Expanded(
                  child:  TextField(
                    controller: textController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration:const InputDecoration(
                        border:InputBorder.none,
                        hintText: "Type Some Thing ...",
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.blueAccent,
                        )
                    ),
                  ),
                ),
                IconButton(onPressed: (){
                  Navigator.pop(context) ;
                },
                    icon:const Icon(Icons.image , color: Colors.blueAccent,)),
                IconButton(onPressed: (){
                  Navigator.pop(context) ;
                },
                    icon: Icon(Icons.camera_alt_outlined , color: Colors.blueAccent,)),
              ],
            ),
          ),
        ),

        MaterialButton(
            minWidth: 0,
            shape:const CircleBorder(),
            color: Colors.green,

            onPressed: (){
              // if(textController.text.isNotEmpty){
              //   Api.sendMessage(user, textController.text) ;
              //   textController.text = "" ;
              // }

            },
            child:const Icon(Icons.send , color: Colors.white,size: 28,)),
      ],
    );
  }
}