import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UserChatScreen extends StatefulWidget {
  final String userId;
  final String userName;
  final String userImageUrl;

  UserChatScreen({required this.userId, required this.userName, required this.userImageUrl});

  @override
  _UserChatScreenState createState() => _UserChatScreenState();
}

class _UserChatScreenState extends State<UserChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User _currentUser;

  @override
  void initState() {
    super.initState();
    _currentUser = _auth.currentUser!;
  }

  Future<void> _sendMessage(String text) async {
    if (text.isEmpty) return;
    await _firestore.collection('messages').add({
      'text': text,
      'senderId': _currentUser.uid,
      'receiverId': widget.userId,
      'timestamp': Timestamp.now(),
    });
    _controller.clear();
  }

  Future<void> _sendImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      String imageUrl = await _uploadImage(File(pickedFile.path));
      await _firestore.collection('messages').add({
        'imageUrl': imageUrl,
        'senderId': _currentUser.uid,
        'receiverId': widget.userId,
        'timestamp': Timestamp.now(),
      });
    }
  }

  Future<String> _uploadImage(File file) async {
    // Implement your image upload logic here and return the image URL
    // For example, you might upload to Firebase Storage and get the download URL
    // This is a placeholder implementation
    return 'https://example.com/path/to/your/image.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.userImageUrl),
            ),
            SizedBox(width: 10),
            Text(widget.userName),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('messages')
                  .where('senderId', isEqualTo: _currentUser.uid)
                  .where('receiverId', isEqualTo: widget.userId)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                final messages = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: messages!.length,
                  itemBuilder: (context, index) {
                    var message = messages[index];
                    return ListTile(
                      title: Text(message['text'] ?? ''),
                      leading: message['imageUrl'] != null
                          ? Image.network(message['imageUrl'])
                          : null,
                    );
                  },
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Type your message...',
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _sendMessage(_controller.text),
              ),
              IconButton(
                icon: Icon(Icons.photo),
                onPressed: _sendImage,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
