import 'package:dating_app/core/model/settings_profile_model.dart';
import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/utils/const_text.dart';
import 'package:dating_app/core/widget/custom_materail_botton.dart';
import 'package:dating_app/core/widget/custom_appbar.dart';
import 'package:dating_app/feature/settings_profile/widgets/settings_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreenProfile extends StatefulWidget {
  const SettingsScreenProfile({
    super.key,
  });

  @override
  State<SettingsScreenProfile> createState() => _SettingsScreenProfileState();
}

class _SettingsScreenProfileState extends State<SettingsScreenProfile> {
  final List<SettingsProfileModel> settings = [
    SettingsProfileModel(
        title: ConstText.password,
        leading: const Icon(
          Icons.lock,
          color: AppColor.kPrimaryColor,
        ),
        trailing: const Icon(
          Icons.arrow_back_ios_new,
          color: AppColor.kPrimaryColor,
        )),
    SettingsProfileModel(
        title: ConstText.invoice,
        leading: const Icon(
          Icons.inventory_outlined,
          color: AppColor.kPrimaryColor,
        ),
        trailing: const Icon(
          Icons.arrow_back_ios_new,
          color: AppColor.kPrimaryColor,
        )),
    SettingsProfileModel(
        title: ConstText.blockList,
        leading: const Icon(
          Icons.block_flipped,
          color: AppColor.kPrimaryColor,
        ),
        trailing: const Icon(
          Icons.arrow_back_ios_new,
          color: AppColor.kPrimaryColor,
        )),
    SettingsProfileModel(
        title: ConstText.about,
        leading: const Icon(
          Icons.info,
          color: AppColor.kPrimaryColor,
        ),
        trailing: const Icon(
          Icons.arrow_back_ios_new,
          color: AppColor.kPrimaryColor,
        )),
    SettingsProfileModel(
        title: ConstText.share,
        leading: const Icon(
          Icons.ios_share,
          color: AppColor.kPrimaryColor,
        ),
        trailing: const Icon(
          Icons.arrow_back_ios_new,
          color: AppColor.kPrimaryColor,
        )),
  ];
  bool value = false;
  @override
  Widget build(BuildContext context) {
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
                text: ConstText.logout,
                onPressed: () {},
              ),
              verticalSpacing(10),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    ConstText.delete,
                    style:
                        TextStyle(color: AppColor.kPrimaryColor, fontSize: 20),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Padding notificationWidget() {
    return Padding(
      padding: const EdgeInsets.only(right: 29, left: 16),
      child: Row(
        children: [
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
          const Spacer(),
          const Text(
            ConstText.notifications,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          horizontalSpacing(15),
          const Icon(
            Icons.notifications,
            color: AppColor.kPrimaryColor,
            size: 35,
          )
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
      text: ConstText.settingsProfile,
    );
  }
}
