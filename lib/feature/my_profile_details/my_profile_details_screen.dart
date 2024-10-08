import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/feature/authentecation/model/user_model.dart';
import 'package:dating_app/feature/edit_profile_screen/edit_profile_screen.dart';
import 'package:dating_app/feature/my_profile_details/widgets/my_profile_details_image_and_header.dart';
import 'package:dating_app/feature/my_profile_details/widgets/my_profile_details_quick_view.dart';
import 'package:dating_app/core/widget/custom_appbar.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyProfileDetailsScreen extends StatelessWidget {
  MyProfileDetailsScreen({
    super.key,
  });
  // final UserModel userModel ;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                profileAppBar(context),
                 const MyProfileImageAndHeader(
                    // userModel: userModel,
                    ),
                Padding(
                  padding:  const EdgeInsets.only(
                      right: 20, top: 15, bottom: 15, left: 20),
                  child: Text(
                    S.of(context).qucikview,
                    style:  TextStyle(fontSize: 22.sp),
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
                  child: QuickViewInMyProfile(
                      // userModel:userModel ,
                      ),
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColor.kPrimaryColor),
                      ),
                      child:  const Text(
                        "Block",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
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
      text: S.of(context).myProfile,
      icon: const Icon(
        Icons.edit_note,
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const EditProfileScreen()));
      },
    );
  }
}
