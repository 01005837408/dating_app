// profile_photos_cubit.dart

import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'profile_photos_states.dart';

class ProfilePhotosCubit extends Cubit<ProfilePhotosState> {
  ProfilePhotosCubit() : super(ProfilePhotosInitial());

  Future<void> fetchImages() async {
    try {
      emit(ProfilePhotosLoading());
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('images').orderBy('timestamp', descending: true).get();
      List<String> imageUrls = querySnapshot.docs.map((doc) => doc['url'] as String).toList();
      emit(ProfilePhotosLoaded(imageUrls: imageUrls));
    } catch (e) {
      emit(ProfilePhotosError(message: 'Failed to fetch images'));
    }
  }

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      File image = File(pickedFile.path);
      await _uploadImage(image);
    }
  }

  Future<void> _uploadImage(File image) async {
    try {
      String fileName = 'images/${DateTime.now().millisecondsSinceEpoch}.jpg';
      UploadTask uploadTask = FirebaseStorage.instance.ref(fileName).putFile(image);

      TaskSnapshot snapshot = await uploadTask;
      String downloadURL = await snapshot.ref.getDownloadURL();

      await FirebaseFirestore.instance.collection('images').add({
        'url': downloadURL,
        'timestamp': FieldValue.serverTimestamp(),
      });

      List<String> updatedImageUrls = List.from((state as ProfilePhotosLoaded).imageUrls)..add(downloadURL);
      emit(ProfilePhotosLoaded(imageUrls: updatedImageUrls));

      print('Image uploaded successfully: $downloadURL');
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  Future<void> deleteImage(String imageUrl) async {
    try {
      await FirebaseStorage.instance.refFromURL(imageUrl).delete();
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('images')
          .where('url', isEqualTo: imageUrl)
          .get();
      for (var doc in querySnapshot.docs) {
        await FirebaseFirestore.instance.collection('images').doc(doc.id).delete();
      }
      List<String> updatedImageUrls = List.from((state as ProfilePhotosLoaded).imageUrls)..remove(imageUrl);
      emit(ProfilePhotosLoaded(imageUrls: updatedImageUrls));
      print('Image deleted successfully: $imageUrl');
    } catch (e) {
      print('Error deleting image: $e');
    }
  }
}
