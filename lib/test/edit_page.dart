// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class EditScreen extends StatefulWidget {
//   @override
//   _EditScreenState createState() => _EditScreenState();
// }

// class _EditScreenState extends State<EditScreen> {
//   List<String> data = [];
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   User? user;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _signInAnonymously();
//   }

//   Future<void> _signInAnonymously() async {
//     UserCredential userCredential = await _auth.signInAnonymously();
//     user = userCredential.user;
//     await _loadUserData();
//   }

//   Future<void> _loadUserData() async {
//     if (user != null) {
//       DocumentSnapshot userDoc = await _firestore.collection('users').doc(user!.uid).get();
//       if (userDoc.exists) {
//         List<dynamic> userData = userDoc.get('data_field');
//         setState(() {
//           data = List<String>.from(userData);
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           isLoading = false;
//         });
//       }
//     }
//   }

//   Future<void> _showEditDialog(int index) async {
//     TextEditingController _controller = TextEditingController(text: data[index]);

//     return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Edit Data'),
//           content: TextField(
//             controller: _controller,
//             decoration: const InputDecoration(hintText: "Enter new value"),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () async {
//                 String newValue = _controller.text;
//                 setState(() {
//                   data[index] = newValue;
//                 });

//                 // Update data in Firestore
//                 if (user != null) {
//                   await _firestore.collection('users').doc(user!.uid).set({
//                     'data_field': data,
//                   });
//                 }

//                 Navigator.of(context).pop();
//               },
//               child: const Text('Save'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Data'),
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : data.isEmpty
//               ? Center(child: Text('No data available'))
//               : ListView.builder(
//                   itemCount: data.length,
//                   itemBuilder: (context, index) {
//                     return Column(
//                       children: [
//                         ListTile(
//                           title: const Text(
//                             "First Name",
//                             style: TextStyle(color: Colors.black),
//                           ),
//                           subtitle: Text(data[index]),
//                           trailing: IconButton(
//                             onPressed: () {
//                               _showEditDialog(index);
//                             },
//                             icon: const Icon(Icons.edit),
//                           ),
//                         ),
//                         const SizedBox(height: 30),
//                       ],
//                     );
//                   },
//                 ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: EditScreen(),
//   ));
// }
