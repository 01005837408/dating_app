import 'package:dating_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class MyProfileDetailsImage extends StatelessWidget {
  const MyProfileDetailsImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.profileImage,
      height: MediaQuery.of(context).size.height / 2.6,
      width: MediaQuery.of(context).size.height / 1,
      fit: BoxFit.cover,
    );
  }
}
