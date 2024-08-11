// ignore_for_file: use_build_context_synchronously

import 'package:dating_app/core/api/api.dart';
import 'package:dating_app/feature/authentecation/model/user_model.dart';
import 'package:dating_app/feature/chat/widget/chat_user_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ChatListScreen> {
  List<UserModel> list = [];
  List<UserModel> listSearch = [];
  bool isSearch = false;

  @override
  void initState() {
   // Api.getAllUser();
    Api.getSetInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.home),
        ),
        title: isSearch
            ? TextField(
                onChanged: (val) {
                  listSearch.clear();
                  for (var i in list) {
                    if (i.fname.toLowerCase().contains(val.toLowerCase()) ||
                        i.email.toLowerCase().contains(val.toLowerCase())) {
                      listSearch.add(i);
                      setState(() {
                        listSearch;
                      });
                    }
                  }
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              )
            : const Text(
                "Chat app",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearch = !isSearch;
              });
            },
            icon: Icon(isSearch ? Icons.clear : Icons.search),
          ),
          // IconButton(
          //   onPressed: (){
          //     Navigator.of(context).pushReplacement(
          //       MaterialPageRoute(builder: (context) => ProfileScreen(user: Api.me!))
          //     );
          //   },
          //   icon: const Icon(Icons.more_vert),
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          await GoogleSignIn().signOut();
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_comment_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: StreamBuilder(
          stream: Api.getAllUser(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active:
              case ConnectionState.done:
                final data = snapshot.data?.docs;

                list = data?.map((e) => UserModel.fromMap(e.data())).toList() ??
                    [];

                if (list.isNotEmpty) {
                  return ListView.builder(
                    itemCount: list.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => ChatUserCard(
                        user:  list[index]),
                  );
                } else {
                  return const Center(
                      child: Text(
                    "No Connection Found",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ));
                }

              // TODO: Handle this case.
            }
          }),
    );
  }
}
