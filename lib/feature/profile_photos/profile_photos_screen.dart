// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'dart:io';
import 'package:dating_app/feature/profile_photos/widgets/grid_view_photos.dart';
import 'package:dating_app/feature/profile_photos/widgets/profile_photos_header_container.dart';
import 'package:dating_app/feature/profile_photos/widgets/shimmer_loading_grid.dart';
import 'package:dating_app/test/test2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/widget/custom_appbar.dart';

class ProfilePhotosScreen extends StatefulWidget {
  const ProfilePhotosScreen({super.key});

  @override
  _ProfilePhotosScreenState createState() => _ProfilePhotosScreenState();
}

class _ProfilePhotosScreenState extends State<ProfilePhotosScreen> {
  List<String> _imageUrls = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchImages();
  }

  Future<void> _fetchImages() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('images').orderBy('timestamp', descending: true).get();
    setState(() {
      _imageUrls = querySnapshot.docs.map((doc) => doc['url'] as String).toList();
      _isLoading = false;
    });
  }

  Future<void> _pickImage(ImageSource source) async {
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

      setState(() {
        _imageUrls.add(downloadURL);
      });

      print('Image uploaded successfully: $downloadURL');
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  Future<void> _deleteImage(String imageUrl) async {
    try {
      await FirebaseStorage.instance.refFromURL(imageUrl).delete();
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('images')
          .where('url', isEqualTo: imageUrl)
          .get();
      for (var doc in querySnapshot.docs) {
        await FirebaseFirestore.instance.collection('images').doc(doc.id).delete();
      }
      setState(() {
        _imageUrls.remove(imageUrl);
      });
      print('Image deleted successfully: $imageUrl');
    } catch (e) {
      print('Error deleting image: $e');
    }
  }

  void _showDeleteDialog(String imageUrl) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Image'),
        content: Text('Are you sure you want to delete this image?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _deleteImage(imageUrl);
            },
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        color: AppColor.kPrimaryColor,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Pick Image From Gallery or Camera", style: TextStyle(fontSize: 20, color: Colors.white)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.gallery);
              },
              child: Text("Pick Image From Gallery"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.camera);
              },
              child: Text("Pick Image From Camera"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAppBar(
                widget: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: AppColor.kPrimaryColor,
                text: 'الصور',
              ),
              verticalSpacing(15),
              ProfilePhotosHeaderContainer(onCameraTap: _showBottomSheet),
              verticalSpacing(20),
              const Divider(
                indent: 50,
                endIndent: 50,
                color: AppColor.kPrimaryColor,
                thickness: 4,
              ),
               GridViewPhotos(imageUrls: _imageUrls, onLongPress: _showDeleteDialog),
            ],
          ),
        ),
      ),
    );
  }
}

