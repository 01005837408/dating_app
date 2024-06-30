import 'package:flutter/material.dart';

class ViewMyProfileModel {
  final ImageProvider<Object> image;
  final String title;
  final String subtitle;

  ViewMyProfileModel(
      {required this.image, required this.title, required this.subtitle});
}
