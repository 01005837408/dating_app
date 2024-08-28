// ignore_for_file: use_build_context_synchronously

import 'package:dating_app/core/model/settings_profile_model.dart';
import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/widget/custom_materail_botton.dart';
import 'package:dating_app/core/widget/custom_appbar.dart';
import 'package:dating_app/feature/authentecation/presentation/signIn/sign_in.dart';
import 'package:dating_app/feature/settings_profile/change_password.dart';
import 'package:dating_app/feature/settings_profile/widgets/settings_body.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsScreenProfile extends StatefulWidget {
  const SettingsScreenProfile({
    super.key,
  });

  @override
  State<SettingsScreenProfile> createState() => _SettingsScreenProfileState();
}

class _SettingsScreenProfileState extends State<SettingsScreenProfile> {
  bool value = false;
  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final List<SettingsProfileModel> settings = [
      SettingsProfileModel(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ChangePasswordScreen()));
          },
          title: S.of(context).password,
          leading: const Icon(
            Icons.lock,
            color: AppColor.kPrimaryColor,
          ),
          trailing: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColor.kPrimaryColor,
          )),
      SettingsProfileModel(
          onPressed: () {},
          title: S.of(context).invoice,
          leading: const Icon(
            Icons.inventory_outlined,
            color: AppColor.kPrimaryColor,
          ),
          trailing: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColor.kPrimaryColor,
          )),
      SettingsProfileModel(
          onPressed: () {},
          title: S.of(context).blockList,
          leading: const Icon(
            Icons.block_flipped,
            color: AppColor.kPrimaryColor,
          ),
          trailing: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColor.kPrimaryColor,
          )),
      SettingsProfileModel(
          onPressed: () {},
          title: S.of(context).about,
          leading: const Icon(
            Icons.info,
            color: AppColor.kPrimaryColor,
          ),
          trailing: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColor.kPrimaryColor,
          )),
      SettingsProfileModel(
          onPressed: () {},
          title: S.of(context).share,
          leading: const Icon(
            Icons.ios_share,
            color: AppColor.kPrimaryColor,
          ),
          trailing: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColor.kPrimaryColor,
          )),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const AppBar(),
              verticalSpacing(30),
              notificationWidget(),
              SettingsBody(settingsmodel: settings),
              verticalSpacing(30),
              CustomMaterialBottons(
                backgroundBottonsColors: AppColor.lightRed,
                bourderRedias: 50,
                text: S.of(context).logout,
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const SignInScreen()),
                      (route) => false);
                },
              ),
              verticalSpacing(10),
              TextButton(
                  onPressed: ()async {
//                     try {
//   await user!.delete();
//   Navigator.of(context).pushAndRemoveUntil(
//                       MaterialPageRoute(builder: (_) => const SignInScreen()),
//                       (route) => false);
//   // Handle successful deletion, e.g., navigate to a login screen
// } on FirebaseAuthException catch (e) {
//   // Handle errors, such as re-authentication required
//   if (e.code == 'requires-recent-login') {
//     // Prompt the user to re-authenticate
//     print('The user must re-authenticate before this operation.');
//   } else {
//     print(e.message);
//   }
// }
                  },
                  child: Text(
                    S.of(context).delete,
                    style: const TextStyle(
                        color: AppColor.kPrimaryColor, fontSize: 20),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Padding notificationWidget() {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Row(
        children: [
          const Icon(
            Icons.notifications,
            color: AppColor.kPrimaryColor,
            size: 35,
          ),
          horizontalSpacing(15),
          Text(
            S.of(context).notifications,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const Spacer(),
          Switch(
            inactiveTrackColor: Colors.pink.shade100,
            activeColor: AppColor.kPrimaryColor,
            value: value,
            onChanged: (newValue) {
              setState(() {
                value = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
      text: S.of(context).settingsProfile,
    );
  }
}
