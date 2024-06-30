
import 'package:dating_app/core/api/api.dart';
import 'package:dating_app/core/modal/message_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatefulWidget {
   MessageCard({super.key , required this.message});
   final Message message ;
  @override
  State<MessageCard> createState() => _MessageCardState();
}
class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    return Api.user.uid == widget.message.formId ? greenCard ():blueCard() ;
  }
  Widget blueCard(){
    return Row(
      mainAxisAlignment:  MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Container(
            padding:const EdgeInsets.all(12),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius:const BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              shape: BoxShape.rectangle,
              color: Colors.blueAccent,
          
            ),
            child: Text(widget.message.msg , style:const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),),
          ),
        ),
        Row(
          children: [
            Text(widget.message.sent, style:const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),),
            SizedBox(width: 10,),
            Icon(Icons.done_all_outlined , color: Colors.blue,),
          ],
        ),
      ],
    ) ;
  }

    Widget greenCard()
  {
    return Row(
      mainAxisAlignment:  MainAxisAlignment.spaceBetween,
      children: [


        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Icon(Icons.done_all_outlined , color: Colors.blue,),
            ),
            SizedBox(width: 10,),
            Text(widget.message.sent, style:const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),),
          ],
        ),
        Flexible(
          child: Container(
            padding:const EdgeInsets.all(12),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              shape: BoxShape.rectangle,
              color: Colors.green,

            ),
            child: Text(widget.message.msg , style: TextStyle(
              color: Colors.black,
              fontSize: 16,

            ),),
          ),
        ),
      ],
    ) ;
  }
}
