import 'package:dating_app/core/modal/sign_up_user_modal.dart';
import 'package:dating_app/core/utils/assets.dart';
import 'package:dating_app/core/utils/const_text.dart';
import 'package:dating_app/core/utils/styles.dart';
import 'package:dating_app/feature/profile_screen/profile_screen.dart';
import 'package:dating_app/feature/settings_profile/settings_Screen_profile.dart';
import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
   HomeTitle({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const SettingsScreenProfile()));
              },
              icon: const Icon(
                Icons.settings_input_composite_rounded,
                color: Colors.black,
                size: 30,
              )),
          Text(
            ConstText.appName,
            style: AppStyle.font21bold,
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>  ProfileScreen(),
              ),
            ),
            child: Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(Assets.profileImage),
            ),
          ),
        ],
      ),
    );
  }
}
