import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/feature/profile_photos/data/profile_state.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePhotosCubit extends Cubit<ProfilePhotosState> {
  ProfilePhotosCubit() : super(ProfilePhotosInitial());

  final ImagePicker _picker = ImagePicker();

  Future<void> selectImage(BuildContext context, ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);

    if (image != null) {
      await uploadImage(image);
    }
  }

  Future<void> uploadImage(XFile image) async {
    try {
      emit(ProfilePhotosUploading());

      // Upload to Firebase Storage
      final storageRef = FirebaseStorage.instance.ref().child('profile_photos/${image.name}');
      await storageRef.putFile(File(image.path));
      final imageUrl = await storageRef.getDownloadURL();

      // Save URL to Firestore
      await FirebaseFirestore.instance.collection('profile_photos').add({
        'url': imageUrl,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Fetch images again to update the state
      await fetchImages();
    } catch (e) {
      print('Error uploading image: $e');
      emit(ProfilePhotosError(e.toString()));
    }
  }

  Future<void> fetchImages() async {
    try {
      emit(ProfilePhotosLoading());

      final querySnapshot = await FirebaseFirestore.instance.collection('profile_photos').orderBy('timestamp', descending: true).get();
      final images = querySnapshot.docs.map((doc) => doc['url'] as String).toList();

      emit(ProfilePhotosLoaded(images));
    } catch (e) {
      print('Error fetching images: $e');
      emit(ProfilePhotosError(e.toString()));
    }
  }

  Future<void> deleteImage(String imageUrl) async {
    try {
      emit(ProfilePhotosDeleting());

      // Delete from Firebase Storage
      final storageRef = FirebaseStorage.instance.refFromURL(imageUrl);
      await storageRef.delete();

      // Delete URL from Firestore
      final querySnapshot = await FirebaseFirestore.instance
          .collection('profile_photos')
          .where('url', isEqualTo: imageUrl)
          .get();

      for (var doc in querySnapshot.docs) {
        await doc.reference.delete();
      }

      // Fetch images again to update the state
      await fetchImages();
    } catch (e) {
      print('Error deleting image: $e');
      emit(ProfilePhotosError(e.toString()));
    }
  }
}

