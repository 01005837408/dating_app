import 'package:flutter/material.dart';

class ProfileModel {
  final IconButton icon;
  final String text;
  final IconButton iconButton;
  final VoidCallback onTap;

  ProfileModel(
      {required this.onTap,
      required this.icon,
      required this.text,
      required this.iconButton});
}
