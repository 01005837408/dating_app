// ignore_for_file: prefer_const_constructors

import 'dart:convert';


import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/core/api/api.dart';
import 'package:dating_app/core/modal/message_modal.dart';
import 'package:dating_app/core/modal/user_modal.dart';
import 'package:dating_app/feature/chat/widget/message_card.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key, required this.user});
  ChatUser user;
  List<Message> list = [];

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final textController = TextEditingController();
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
                icon: Icon(Icons.arrow_back)),
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
                  imageUrl: widget.user.image,
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
                  widget.user.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                Text("last seen 3.44 Pm"),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: Api.getAllMessages(widget.user),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return const Center(
                      child: SizedBox(),
                    );
                  case ConnectionState.active:
                  case ConnectionState.done:
                    final data = snapshot.data?.docs;
                    print("Snapshot data: ${snapshot.data}");

                    widget.list =
                        data?.map((e) => Message.fromJson(e.data())).toList() ??
                            [];
                    if (widget.list.isNotEmpty) {
                      return ListView.builder(
                        itemCount: widget.list.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => MessageCard(
                          message: widget.list[index],
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
                      ));
                    }
                }
              },
            ),
          ),
          //////////////// chat Input ///////////////////////////////////////////////
          Row(
            children: [
              SizedBox(
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
                          icon: Icon(
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
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.blueAccent,
                          )),
                    ],
                  ),
                ),
              ),
              MaterialButton(
                  minWidth: 0,
                  shape: CircleBorder(),
                  color: Colors.green,
                  onPressed: () {
                    if (textController.text.isNotEmpty) {
                      Api.sendMessage(widget.user, textController.text);
                      textController.text = "";
                    }
                  },
                  child: Icon(
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
