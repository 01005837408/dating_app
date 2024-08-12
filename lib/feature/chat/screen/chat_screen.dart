import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/core/api/api.dart';
import 'package:dating_app/core/modal/message_modal.dart';
import 'package:dating_app/feature/authentecation/model/user_model.dart';
import 'package:dating_app/feature/chat/widget/message_card.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key, required this.user});
  UserModel user;
  List<MessageModel> list = [];

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final textController = TextEditingController();
   String imageUrl =
                      "https://as1.ftcdn.net/v2/jpg/02/43/12/34/1000_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg";

                  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        flexibleSpace: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  width: 45,
                  height: 45,
                  fit: BoxFit.cover,
                  
                  imageUrl: imageUrl,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.person),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.user.fname,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                const Text("last seen 3.44 Pm"),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<MessageModel>>(
  stream: Api.getAllMessages(widget.user.uid),
  builder: (context, snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.waiting:
      case ConnectionState.none:
        return const Center(child: CircularProgressIndicator());
      case ConnectionState.active:
      case ConnectionState.done:
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final messages = snapshot.data!;
          return ListView.builder(
            reverse: true,
            itemCount: messages.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => MessageCard(
              message: messages[index],
            ),
          );
        } else {
          return const Center(
            child: Text(
              "Say Hi",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }
    }
  },
)

          ),
          //////////////// chat Input ///////////////////////////////////////////////
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Card(
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.emoji_emotions,
                            color: Colors.blueAccent,
                          )),
                      Expanded(
                        child: TextField(
                          controller: textController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Type Some Thing ...",
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.blueAccent,
                              )),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.image,
                            color: Colors.blueAccent,
                          )),
                      IconButton(
                          onPressed: () {
                            // Navigator.pop(context) ;
                          },
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.blueAccent,
                          )),
                    ],
                  ),
                ),
              ),
              MaterialButton(
                  minWidth: 0,
                  shape: const CircleBorder(),
                  color: Colors.green,
                  onPressed: () {
                    if (textController.text.isNotEmpty) {
                      Api.sendMessage(
                        msg:  textController.text ,
                        reciverId: widget.user.uid
                         );
                      textController.text = "";
                    }
                  },
                  child: const Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 28,
                  )),
            ],
          ),
          // ChatInput(
          //   widget.user
          // ),
        ],
      ),
    );
  }
}
