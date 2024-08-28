import 'package:dating_app/core/model/settings_profile_model.dart';
import 'package:dating_app/feature/settings_profile/widgets/settings_body_item.dart';
import 'package:flutter/material.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key, required this.settingsmodel});
  final List<SettingsProfileModel> settingsmodel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: settingsmodel.length,
                itemBuilder: (context, index) {
                  final item = settingsmodel[index];
                  return SettingsBodyItem(
                    settingsmodel: settingsmodel,
                    index: index,
                    onTap: settingsmodel[index].onPressed,
                    
                  );
                }))
      ],
    );
  }
}
