// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class CommentsScreen extends StatefulWidget {
//   final String postId;

//   const CommentsScreen({Key? key, required this.postId}) : super(key: key);

//   @override
//   _CommentsScreenState createState() => _CommentsScreenState();
// }

// class _CommentsScreenState extends State<CommentsScreen> {
//   final TextEditingController _commentController = TextEditingController();
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   void _addComment() async {
//     if (_commentController.text.isNotEmpty) {
//       final user = _auth.currentUser;

//       await _firestore.collection('posts').doc(widget.postId).collection('comments').add({
//         'userId': user!.uid,
//         'userName': user.displayName,
//         'comment': _commentController.text,
//         'timestamp': FieldValue.serverTimestamp(),
//       });

//       _commentController.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Comments'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: _firestore.collection('posts').doc(widget.postId).collection('comments').orderBy('timestamp', descending: true).snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return Center(child: CircularProgressIndicator());
//                 }

//                 final comments = snapshot.data!.docs;

//                 return ListView.builder(
//                   itemCount: comments.length,
//                   itemBuilder: (context, index) {
//                     final comment = comments[index];
//                     return ListTile(
//                       title: Text(comment['userName']),
//                       subtitle: Text(comment['comment']),
//                       trailing: Text(comment['timestamp']?.toDate().toString() ?? ''),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _commentController,
//                     decoration: InputDecoration(
//                       labelText: 'Add a comment...',
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: _addComment,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
