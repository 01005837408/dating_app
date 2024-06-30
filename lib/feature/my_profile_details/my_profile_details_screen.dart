import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/utils/const_text.dart';
import 'package:dating_app/feature/my_profile_details/widgets/my_profile_details_image_and_header.dart';
import 'package:dating_app/feature/my_profile_details/widgets/my_profile_details_quick_view.dart';
import 'package:dating_app/core/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class MyProfileDetailsScreen extends StatelessWidget {
  const MyProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                profileAppBar(context),
                const MyProfileImageAndHeader(),
                const Padding(
                  padding: EdgeInsets.only(right: 20, top: 15, bottom: 15),
                  child: Text(
                    ConstText.qucikview,
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                const Divider(
                  endIndent: 50,
                  indent: 50,
                  thickness: 2,
                  color: AppColor.kPrimaryColor,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: QuickViewInMyProfile(),
                )
              ],
            ),
          )),
    );
  }

  CustomAppBar profileAppBar(BuildContext context) {
    return CustomAppBar(
      backgroundColor: AppColor.kPrimaryColor,
      iconColor: Colors.white,
      widget: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 30,
          )),
      text: ConstText.myProfile,
      icon: const Icon(
        Icons.settings,
      ),
    );
  }
}
