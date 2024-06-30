import 'package:dating_app/core/model/settings_profile_model.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class SettingsBodyItem extends StatelessWidget {
  const SettingsBodyItem({
    super.key,
    required this.settingsmodel,
    required this.index,
  });
  final int index;
  final List<SettingsProfileModel> settingsmodel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {},
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: AppColor.kPrimaryColor,
          size: 35,
        ),
        title: Text(
          settingsmodel[index].title,
          textAlign: TextAlign.right,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        trailing: Icon(
          settingsmodel[index].leading.icon,
          color: AppColor.kPrimaryColor,
          size: 30,
        ),
      ),
    );
  }
}
