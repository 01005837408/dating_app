// import 'dart:js';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class Picker {
//   final ImagePicker _picker = ImagePicker();
//   XFile? _image;

//   Future<void> _pickImage(ImageSource source , context) async {
//     try {
//       final pickedImage = await _picker.pickImage(source: source);
//       setState(() {
//         _image = pickedImage;
//       });
//       Navigator.of(context).pop(); // Close the modal bottom sheet
//     } catch (e) {
//       print(e);
//       Navigator.of(context)
//           .pop(); // Close the modal bottom sheet in case of error
//     }
//   }
// }