
import 'package:flutter/material.dart';

class EditProfileBasciModel {
  final String title;
  String subtitle;
  final IconData icon;

  EditProfileBasciModel({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'icon': icon.codePoint,
    };
  }

  static EditProfileBasciModel fromFirestore(Map<String, dynamic> data) {
    return EditProfileBasciModel(
      title: data['title'],
      subtitle: data['subtitle'],
      icon: IconData(data['icon'], fontFamily: 'MaterialIcons'),
    );
  }
}

class EditProfileLookModel {
  final String title;
  String subtitle;
  final IconData icon;

  EditProfileLookModel({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'icon': icon.codePoint,
    };
  }

  static EditProfileLookModel fromFirestore(Map<String, dynamic> data) {
    return EditProfileLookModel(
      title: data['title'],
      subtitle: data['subtitle'],
      icon: IconData(data['icon'], fontFamily: 'MaterialIcons'),
    );
  }
}

class EditProfileLifeStyleModel {
  final String title;
  String subtitle;
  final IconData icon;

  EditProfileLifeStyleModel({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'icon': icon.codePoint,
    };
  }

  static EditProfileLifeStyleModel fromFirestore(Map<String, dynamic> data) {
    return EditProfileLifeStyleModel(
      title: data['title'],
      subtitle: data['subtitle'],
      icon: IconData(data['icon'], fontFamily: 'MaterialIcons'),
    );
  }
}

class EditProfileCaltureeModel {
  final String title;
  String subtitle;
  final IconData icon;

  EditProfileCaltureeModel({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'icon': icon.codePoint,
    };
  }

  static EditProfileCaltureeModel fromFirestore(Map<String, dynamic> data) {
    return EditProfileCaltureeModel(
      title: data['title'],
      subtitle: data['subtitle'],
      icon: IconData(data['icon'], fontFamily: 'MaterialIcons'),
    );
  }
}
