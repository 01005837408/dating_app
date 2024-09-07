
import 'package:dating_app/feature/authentecation/model/user_model.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundImage: user.profilePicture.isNotEmpty
          ? NetworkImage(user.profilePicture)
          : const AssetImage('assets/images/Home Screen-image.jpg')
              as ImageProvider,
    );
  }
}