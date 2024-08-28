import 'package:flutter/material.dart';

class EditProfileBasicModel {
  final String title;
  String subtitle;
  final int? iconCode;

  static const Map<int, IconData> iconMap = {
    0: Icons.person,
    1: Icons.star,
    2: Icons.favorite,
    3: Icons.home,
  };

  EditProfileBasicModel({
    required this.title,
    required this.subtitle,
     this.iconCode,
  });

  IconData get icon => iconMap[iconCode] ?? Icons.help_outline;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'iconCode': iconCode,
    };
  }

  static EditProfileBasicModel fromFirestore(Map<String, dynamic> data) {
    return EditProfileBasicModel(
      title: data['title'],
      subtitle: data['subtitle'],
      iconCode: data['iconCode'],
    );
  }
}

class EditProfileLookModel {
  final String title;
  String subtitle;
  final int? iconCode;

  static const Map<int, IconData> iconMap = {
    0: Icons.visibility,
    1: Icons.visibility_off,
    2: Icons.face,
    3: Icons.camera,
  };

  EditProfileLookModel({
    required this.title,
    required this.subtitle,
     this.iconCode,
  });

  IconData get icon => iconMap[iconCode] ?? Icons.help_outline;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'iconCode': iconCode,
    };
  }

  static EditProfileLookModel fromFirestore(Map<String, dynamic> data) {
    return EditProfileLookModel(
      title: data['title'],
      subtitle: data['subtitle'],
      iconCode: data['iconCode'],
    );
  }
}

class EditProfileLifeStyleModel {
  final String title;
  String subtitle;
  final int? iconCode;

  static const Map<int, IconData> iconMap = {
    0: Icons.nature,
    1: Icons.fitness_center,
    2: Icons.spa,
    3: Icons.local_dining,
  };

  EditProfileLifeStyleModel({
    required this.title,
    required this.subtitle,
     this.iconCode,
  });

  IconData get icon => iconMap[iconCode] ?? Icons.help_outline;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'iconCode': iconCode,
    };
  }

  static EditProfileLifeStyleModel fromFirestore(Map<String, dynamic> data) {
    return EditProfileLifeStyleModel(
      title: data['title'],
      subtitle: data['subtitle'],
      iconCode: data['iconCode'],
    );
  }
}

class EditProfileCultureModel {
  final String title;
  String subtitle;
  final int? iconCode;

  static const Map<int, IconData> iconMap = {
    0: Icons.language,
    1: Icons.public,
    2: Icons.book,
    3: Icons.art_track,
  };

  EditProfileCultureModel({
    required this.title,
    required this.subtitle,
     this.iconCode,
  });

  IconData get icon => iconMap[iconCode] ?? Icons.help_outline;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'iconCode': iconCode,
    };
  }

  static EditProfileCultureModel fromFirestore(Map<String, dynamic> data) {
    return EditProfileCultureModel(
      title: data['title'],
      subtitle: data['subtitle'],
      iconCode: data['iconCode'],
    );
  }
}
