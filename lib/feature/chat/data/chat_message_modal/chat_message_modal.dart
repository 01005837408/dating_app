import 'package:flutter/cupertino.dart';

enum ChatMessageType{text  , image }
enum ChatMessageState{netSent , notView , viewed}
class ChatMessageModal{
String text ;
ChatMessageType massageType ;
ChatMessageState messageState ;
final bool isSender ;
final String? sender ;
final String? senderImage ;
final String? imageUrl ;

  ChatMessageModal(
      {
        this.text = "" ,
        required this.messageState,
        required this.massageType,
        required this.isSender, this.sender, this.senderImage, this.imageUrl});

}
class  ChatAllMessages with ChangeNotifier{  //
  List<ChatMessageModal> chatMessages = [
    ChatMessageModal(
      text:"Hi Mohamed , How are You",
      massageType: ChatMessageType.text,
      messageState: ChatMessageState.viewed,
      isSender:true, // means that i am send message
    ),
    ChatMessageModal(
      text:"Hi Mohamed , How are You",
      massageType: ChatMessageType.text,
      messageState: ChatMessageState.viewed,
      isSender:false, // means that i am send message
    ),
    ChatMessageModal(
      text:"Hi Mohamed , How are You",
      massageType: ChatMessageType.text,
      messageState: ChatMessageState.viewed,
      isSender:true, // means that i am send message
    ),
    ChatMessageModal(
      text:"Hi Mohamed , How are You",
      massageType: ChatMessageType.text,
      messageState: ChatMessageState.viewed,
      isSender:false, // means that i am send message
    ),
    ChatMessageModal(
      text:"Hi Mohamed , How are You",
      massageType: ChatMessageType.text,
      messageState: ChatMessageState.viewed,
      isSender:true, // means that i am send message
    ),
    ChatMessageModal(
      text:"Hi Mohamed , How are You",
      massageType: ChatMessageType.text,
      messageState: ChatMessageState.viewed,
      isSender:false, // means that i am send message
    ),
    ChatMessageModal(
      text:"Hi Mohamed , How are You",
      massageType: ChatMessageType.text,
      messageState: ChatMessageState.viewed,
      isSender:false, // means that i am send message
    )
  ];
  void addMessage(ChatMessageModal message){
    chatMessages.add(message);
    notifyListeners();
  }
 ChatAllMessages  get getMessageList => ChatAllMessages();
// List<ChatMessageModal>get getMessageList => ChatAllMessages();
}