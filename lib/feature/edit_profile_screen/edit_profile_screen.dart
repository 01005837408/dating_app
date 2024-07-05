import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/widget/custom_appbar.dart';
import 'package:dating_app/feature/edit_profile_screen/edit_profile_body.dart';
import 'package:dating_app/feature/profile_screen/widgets/profile_pic_and_name.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({
    super.key,
  });
// ChatUser user ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kPrimaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  CustomAppBar(
                    text: S.of(context).EditProfile,
                    backgroundColor: AppColor.kPrimaryColor,
                    iconColor: Colors.white,
                    icon: const Icon(
                      Icons.settings,
                    ),
                    widget: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 14,
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 1,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45),
                      ),
                    ),
                    child: const Stack(
                      children: [
                        ProfilePictureAndName(),
                        EditProfileBody(),
                      ],
                    ),
                  )
                ],
              ),
              // Positioned(
              //   left: 233,
              //   top: 200,
              //   child: CircleAvatar(
              //     radius: 16,
              //     backgroundColor: Colors.white.withOpacity(0.9),
              //     child: IconButton(
              //         icon: Icon(
              //           Icons.edit,
              //           color: AppColor.kPrimaryColor,
              //         ),
              //         onPressed: () {
              //           // bottomModelSheetForEditImage() ;
              //         }),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
