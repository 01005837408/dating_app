import 'package:dating_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage(Assets.profileImage)
    );
  }
}
