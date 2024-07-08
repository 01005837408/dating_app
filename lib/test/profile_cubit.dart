// // edit_profile_cubit.dart
// import 'dart:io';

// import 'package:bloc/bloc.dart';
// import 'package:dating_app/test/profile_state.dart';
// import 'package:dating_app/test/userModel.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class EditProfileCubit extends Cubit<EditProfileState> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;

//   EditProfileCubit() : super(EditProfileState());

//   void updateProfile(UserModel user, String? imagePath) async {
//     emit(EditProfileState(loading: true));
//     try {
//       String? imageUrl;
//       if (imagePath != null) {
//         Reference ref = _storage.ref().child('profile_images').child(user.uid);
//         UploadTask uploadTask = ref.putFile(File(imagePath));
//         TaskSnapshot taskSnapshot = await uploadTask;
//         imageUrl = await taskSnapshot.ref.getDownloadURL();
//       }

//       UserModel updatedUser = UserModel(
//         uid: user.uid,
//         username: user.username,
//         email: user.email,
//         imageUrl: imageUrl ?? user.imageUrl,
//       );

//       await _firestore.collection('users').doc(user.uid).update(updatedUser.toMap());

//       emit(EditProfileState(success: true));
//     } catch (e) {
//       emit(EditProfileState(errorMessage: e.toString()));
//     }
//   }
// }
