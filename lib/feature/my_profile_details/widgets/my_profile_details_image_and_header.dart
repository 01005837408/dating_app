import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/feature/my_profile_details/widgets/my_profile_details_header.dart';
import 'package:dating_app/feature/my_profile_details/widgets/my_profile_details_image.dart';
import 'package:flutter/material.dart';

class MyProfileImageAndHeader extends StatelessWidget {
  const MyProfileImageAndHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.kPrimaryColor, width: 1.2)),
      child: Column(
        children: [
          const MyProfileDetailsImage(),
          verticalSpacing(10),
          const MyProfileDetailsHeader(),
        ],
      ),
    );
  }
}
