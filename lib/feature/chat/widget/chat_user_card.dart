import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/feature/authentecation/model/user_model.dart';
import 'package:dating_app/feature/chat/screen/chat_screen.dart';
import 'package:flutter/material.dart';

class ChatUserCard extends StatefulWidget {
  final String userId;
  final String userName;

  // final UserModel user;

  const ChatUserCard({required this.userId, required this.userName,  Key? key}) : super(key: key);

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  String? profilePicture;

  @override
  void initState() {
    super.initState();
    _fetchUserProfilePicture();
  }

  Future<void> _fetchUserProfilePicture() async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userId)
          .get();

      if (userDoc.exists) {
        setState(() {
          profilePicture = userDoc['profilePicture'] ?? '';
        });
      }
    } catch (e) {
      // Handle errors if necessary
      print('Error fetching profile picture: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(
        //   user: widget.userId,
        // )));
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: profilePicture != null && profilePicture!.isNotEmpty
              ? NetworkImage(profilePicture!)
              : const AssetImage('assets/images/Home Screen-image.jpg') as ImageProvider,
        ),
        title: Text(widget.userName),
        // Add other details like last message or timestamp here
      ),
    );
  }
}
