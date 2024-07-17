import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/feature/profile_photos/data/profile_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePhotosCubit extends Cubit<ProfilePhotosState> {
  final ImagePicker _picker = ImagePicker();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ProfilePhotosCubit() : super(ProfilePhotosInitial());

  Future<void> selectImage(BuildContext context, ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);

    if (image != null) {
      await uploadImage(image);
    }
  }

  Future<void> uploadImage(XFile image) async {
    try {
      emit(ProfilePhotosUploading());

      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        emit(ProfilePhotosError("User not authenticated"));
        return;
      }

      final storageRef = FirebaseStorage.instance.ref().child(
          'profile_photos/${currentUser.uid}/${DateTime.now().millisecondsSinceEpoch}.jpg');
      await storageRef.putFile(File(image.path));
      final imageUrl = await storageRef.getDownloadURL();

      await _firestore
          .collection('users')
          .doc(currentUser.uid)
          .collection('profile_photos')
          .add({
        'url': imageUrl,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      emit(ProfilePhotosError(e.toString()));
    }
  }

  Stream<List<String>> getImagesStream() {
    final currentUser = _auth.currentUser;
    if (currentUser == null) {
      return Stream.error("User not authenticated");
    }

    return _firestore
        .collection('users')
        .doc(currentUser.uid)
        .collection('profile_photos')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((querySnapshot) =>
            querySnapshot.docs.map((doc) => doc['url'] as String).toList());
  }

  Future<void> deleteImage(String imageUrl) async {
    try {
      emit(ProfilePhotosDeleting());

      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        emit(ProfilePhotosError("User not authenticated"));
        return;
      }

      final imageRef = FirebaseStorage.instance.refFromURL(imageUrl);
      await imageRef.delete();

      final querySnapshot = await _firestore
          .collection('users')
          .doc(currentUser.uid)
          .collection('profile_photos')
          .where('url', isEqualTo: imageUrl)
          .get();
      final docId = querySnapshot.docs.first.id;
      await _firestore
          .collection('users')
          .doc(currentUser.uid)
          .collection('profile_photos')
          .doc(docId)
          .delete();
    } catch (e) {
      emit(ProfilePhotosError(e.toString()));
    }
  }
}

