import 'package:flutter/material.dart';

class SettingsProfileModel {
  final String title;
  final Icon leading;
  final Icon trailing;
   void Function() onPressed;
  SettingsProfileModel(
      {required this.title, required this.leading, required this.trailing, required this.onPressed});
}
