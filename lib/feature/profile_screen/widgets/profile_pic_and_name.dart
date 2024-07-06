// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:dating_app/core/api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePictureAndName extends StatefulWidget {
  const ProfilePictureAndName({
    super.key,
  });

  @override
  State<ProfilePictureAndName> createState() => _ProfilePictureAndNameState();
}

class _ProfilePictureAndNameState extends State<ProfilePictureAndName> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedImage = await _picker.pickImage(source: source);
      setState(() {
        _image = pickedImage;
      });
      Navigator.of(context).pop(); // Close the modal bottom sheet
    } catch (e) {
      print(e);
      Navigator.of(context)
          .pop(); // Close the modal bottom sheet in case of error
    }
  }

  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Photo Library'),
                  onTap: () {
                    _pickImage(ImageSource.gallery);
                    Api.updateProfilePicture(File(_image!.path));
                    setState(() {});
                  }),
              ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: () {
                    _pickImage(ImageSource.camera);
                    Api.updateProfilePicture(File(_image!.path));
                    setState(() {});
                  }),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // GestureDetector(
        //   onTap: () => _showImageSourceActionSheet(context),
        //   child: CircleAvatar(
        //     backgroundImage: _image != null
        //         ? FileImage(File(_image!.path))
        //         : NetworkImage(
        //             "https://as1.ftcdn.net/v2/jpg/02/43/12/34/1000_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
        //           ) as ImageProvider,
        //     radius: 60,
        //   ),
        // ),
        SizedBox(height: 75.h,),
        Center(
          child: Text(
            'Hadi Saed',
            style: GoogleFonts.italiana(
              fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 26
            )
            // TextStyle(
            //     fontWeight: FontWeight.bold,
            //     color: Colors.white,
            //     fontSize: 26),
          ),
        ),
        Text(
          'ID : 215020',
          style: GoogleFonts.adamina(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 18  ),
        ),
      ],
    );
  }
}
