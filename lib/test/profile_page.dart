// // edit_profile_page.dart
// import 'package:dating_app/test/profile_cubit.dart';
// import 'package:dating_app/test/profile_state.dart';
// import 'package:dating_app/test/userModel.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class EditProfilePage extends StatefulWidget {
//   final UserModel user;

//   EditProfilePage({required this.user});

//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {
//   final _usernameController = TextEditingController();
//   final _emailController = TextEditingController();
//   File? _imageFile;

//   @override
//   void initState() {
//     super.initState();
//     _usernameController.text = widget.user.username;
//     _emailController.text = widget.user.email;
//   }

//   Future<void> _pickImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _imageFile = File(pickedFile.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profile'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: BlocProvider(
//           create: (context) => EditProfileCubit(),
//           child: BlocListener<EditProfileCubit, EditProfileState>(
//             listener: (context, state) {
//               if (state?.errorMessage != null) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text(state.errorMessage!)),
//                 );
//               } else if (state!.success) {
//                 Navigator.pop(context, true); // Return true to indicate success
//               }
//             },
//             child: Column(
//               children: [
//                 TextField(
//                   controller: _usernameController,
//                   decoration: InputDecoration(labelText: 'Username'),
//                 ),
//                 TextField(
//                   controller: _emailController,
//                   decoration: InputDecoration(labelText: 'Email'),
//                   keyboardType: TextInputType.emailAddress,
//                 ),
//                 SizedBox(height: 20.0),
//                 if (_imageFile != null) ...[
//                   Image.file(_imageFile!, height: 100, width: 100),
//                   SizedBox(height: 10),
//                 ] else if (widget.user.imageUrl != null) ...[
//                   Image.network(widget.user.imageUrl!, height: 100, width: 100),
//                   SizedBox(height: 10),
//                 ],
//                 ElevatedButton(
//                   onPressed: _pickImage,
//                   child: Text('Pick Image'),
//                 ),
//                 SizedBox(height: 20.0),
//                 BlocBuilder<EditProfileCubit, EditProfileState>(
//                   builder: (context, state) {
//                     return state!.loading
//                         ? CircularProgressIndicator()
//                         : ElevatedButton(
//                             onPressed: () {
//                               UserModel updatedUser = UserModel(
//                                 uid: widget.user.uid,
//                                 username: _usernameController.text,
//                                 email: _emailController.text,
//                                 imageUrl: widget.user.imageUrl,
//                               );
//                               context.read<EditProfileCubit>().updateProfile(updatedUser, _imageFile?.path);
//                             },
//                             child: Text('Update Profile'),
//                           );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
