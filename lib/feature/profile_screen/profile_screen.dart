import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/widget/custom_appbar.dart';
import 'package:dating_app/feature/profile_screen/widgets/profile_body.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(
              backgroundColor: Colors.white,
              iconColor: AppColor.kPrimaryColor,
              icon: Icon(
                Icons.settings,
              ),
              widget: CircleAvatar(
                  radius: 22,
                  backgroundColor: Color(0xFFEDB2C2),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColor.kPrimaryColor,
                    size: 30,
                  )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 14,
            ),
            const ProfileBody(),
          ],
        ),
      )),
    );
  }
}
