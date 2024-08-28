import 'package:dating_app/core/model/settings_profile_model.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class SettingsBodyItem extends StatelessWidget {
  const SettingsBodyItem({
    super.key,
    required this.settingsmodel,
    required this.index,
     required this.onTap,
  });
  final int index;
  final void Function() onTap;
  final List<SettingsProfileModel> settingsmodel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: onTap,
        trailing: const Icon(
          Icons.arrow_forward_ios_outlined,
          color: AppColor.kPrimaryColor,
          size: 35,
        ),
        title: Text(
          settingsmodel[index].title,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        leading: Icon(
          settingsmodel[index].leading.icon,
          color: AppColor.kPrimaryColor,
          size: 30,
        ),
      ),
    );
  }
}
