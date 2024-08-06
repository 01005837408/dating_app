import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final ImagePicker _picker = ImagePicker();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> initialize() async {
    try {
      String userId = _auth.currentUser!.uid;
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();
      if (userDoc.exists) {
        String profilePicture = userDoc['profilePicture'] ?? '';
        emit(ProfileLoaded(profilePicture));
      } else {
        emit(ProfileInitial());
      }
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
  Future<void> initialize2(String userId) async {
    try {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();
      if (userDoc.exists) {
        String profilePicture = userDoc['profilePicture'] ?? '';
        emit(ProfileLoaded(profilePicture));
      } else {
        emit(ProfileInitial());
      }
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedImage = await _picker.pickImage(source: source);
      if (pickedImage != null) {
        File imageFile = File(pickedImage.path);
        emit(ProfileImageSelected(imageFile));

        String downloadURL = await _uploadImageToFirebase(imageFile);
        await _updateProfilePicture(downloadURL);
      }
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<String> _uploadImageToFirebase(File image) async {
    try {
      String userId = _auth.currentUser!.uid;
      Reference storageRef = _storage.ref().child('profile_images').child('$userId.jpg');
      UploadTask uploadTask = storageRef.putFile(image);

      TaskSnapshot storageSnapshot = await uploadTask;
      String downloadURL = await storageSnapshot.ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      throw Exception('Image upload failed');
    }
  }

  Future<void> _updateProfilePicture(String downloadURL) async {
    try {
      String userId = _auth.currentUser!.uid;
      await _firestore.collection('users').doc(userId).update({'profilePicture': downloadURL});
      emit(ProfilePictureUpdated(downloadURL));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
