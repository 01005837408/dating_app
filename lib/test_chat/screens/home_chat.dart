import 'package:dating_app/test_chat/consttent.dart';
import 'package:dating_app/test_chat/screens/chat_screen_1.dart';
import 'package:dating_app/test_chat/screens/chat_screen_2.dart';
import 'package:dating_app/test_chat/screens/sign_in_chat.dart';
import 'package:flutter/material.dart';

class HomeChat extends StatelessWidget {
  const HomeChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Chats "), // ${currentUser.name}
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ChatLogin()),
                );
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: Container(
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18.0),
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                //   Navigator.of(context).pushReplacement(
                //       MaterialPageRoute(builder: (context) => ChatScreen1()));
                },
                child: Column(
                  children: [
                    ListTile(
                      title: Text(users[index].name),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(users[index].image),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
