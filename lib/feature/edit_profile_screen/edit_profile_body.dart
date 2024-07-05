import 'package:dating_app/core/model/edit_profile_model.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/feature/edit_profile_screen/basics_list_view.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<EditProfileModel> editProfileList = [
      EditProfileModel(
        title: ' S.of(context).basicInfo111',
        subtitle: 'hady',
        icon: Icons.person_outline,
      ),
      EditProfileModel(
        title: 'S.of(context).aboutMe111',
        subtitle: 'S.of(context).aboutMeSubtitle',
        icon: Icons.info_outline,
      ),
    ];

    return Positioned(
      top: 150,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).yourBasicInfo,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
                indent: 20,
                endIndent: 20,
                color: AppColor.kPrimaryColor,
                thickness: 2),
            BascisListView(editProfileList: editProfileList),
            Text(
              S.of(context).look,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
                indent: 20,
                endIndent: 20,
                color: AppColor.kPrimaryColor,
                thickness: 2),
          ],
        ),
      ),
    );
  }
}
