import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TestImagePicker extends StatefulWidget {
  const TestImagePicker({super.key});

  @override
  _TestImagePickerState createState() => _TestImagePickerState();
}

class _TestImagePickerState extends State<TestImagePicker> {
  final ImagePicker _picker = ImagePicker();
  File? _image;
  List<String> _imageUrls = [];

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      await _uploadImage();
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;

    try {
      String fileName = 'images/${DateTime.now().millisecondsSinceEpoch}.jpg';
      UploadTask uploadTask = FirebaseStorage.instance.ref(fileName).putFile(_image!);

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

  Future<void> _fetchImages() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('images').orderBy('timestamp', descending: true).get();
    setState(() {
      _imageUrls = querySnapshot.docs.map((doc) => doc['url'] as String).toList();
    });
  }

  Future<void> _deleteImage(String imageUrl) async {
    try {
      // Delete the image from Firebase Storage
      await FirebaseStorage.instance.refFromURL(imageUrl).delete();
      // Delete the image metadata from Firestore
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('images')
          .where('url', isEqualTo: imageUrl)
          .get();
      for (var doc in querySnapshot.docs) {
        await FirebaseFirestore.instance.collection('images').doc(doc.id).delete();
      }
      // Remove the image URL from the local list and update the state
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

  @override
  void initState() {
    super.initState();
    _fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Image')),
      body: _imageUrls.isEmpty
          ? Center(child: Text('No images yet.'))
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: _imageUrls.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onLongPress: () {
                    _showDeleteDialog(_imageUrls[index]);
                  },
                  child: Image.network(_imageUrls[index]),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
