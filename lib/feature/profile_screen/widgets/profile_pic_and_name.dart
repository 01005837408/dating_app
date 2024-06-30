import 'package:dating_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class ProfilePictureAndName extends StatelessWidget {
  const ProfilePictureAndName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      left: 140,
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(Assets.profileImage),
            radius: 60,
          ),
          Text(
            'Hadi Saed',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 26),
          ),
          Text(
            'ID : 215020',
            style: TextStyle(
                fontWeight: FontWeight.w500, color: Colors.white, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
