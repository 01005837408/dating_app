import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/feature/chat/screen/chat_screen.dart';
import 'package:dating_app/feature/authentecation/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatUserCard extends StatefulWidget {
  final UserModel user;

  const ChatUserCard({required this.user, Key? key}) : super(key: key);

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  String? profilePicture;
  String? lastMessage;
  String? lastMessageTime;

  @override
  void initState() {
    super.initState();
    _fetchUserProfilePicture();
    _fetchLastMessage();
  }

  Future<void> _fetchUserProfilePicture() async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.user.uid)
          .get();

      if (userDoc.exists) {
        setState(() {
          profilePicture = userDoc['profilePicture'] ?? '';
        });
      }
    } catch (e) {
      print('Error fetching profile picture: $e');
    }
  }

  Future<void> _fetchLastMessage() async {
    try {
      var querySnapshot = await FirebaseFirestore.instance.collection('users')
      .doc(widget.user.uid)
          .collection('chats')
          .doc(widget.user.uid)
          .collection('messages')
          .orderBy('timestamp', descending: true)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var lastMsgDoc = querySnapshot.docs.first;
        setState(() {
          lastMessage = lastMsgDoc['content'];
          lastMessageTime = DateFormat('hh:mm a').format(lastMsgDoc['timestamp'].toDate());
        });
      }
    } catch (e) {
      print('Error fetching last message: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(user: widget.user),
          ),
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: profilePicture != null && profilePicture!.isNotEmpty
              ? NetworkImage(profilePicture!)
              : const AssetImage('assets/images/Home Screen-image.jpg') as ImageProvider,
        ),
        title: Text(widget.user.fname),
        subtitle: lastMessage != null
            ? Text('$lastMessage\n$lastMessageTime')
            : const Text('No messages yet'),
        isThreeLine: true,
      ),
    );
  }
}
