import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/widget/custom_appbar.dart';
import 'package:dating_app/feature/edit_profile_screen/widgets/edit_profile_body.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
              const EditProfileBody(),
            ],
          ),
        ),
      ),
    );
  }
}
