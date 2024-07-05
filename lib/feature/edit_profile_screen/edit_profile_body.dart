import 'package:dating_app/core/model/edit_profile_model.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/feature/edit_profile_screen/basics_list_view.dart';
import 'package:dating_app/feature/edit_profile_screen/look_list_view.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<EditProfileBasciModel> editProfileBasicList = [
      EditProfileBasciModel(
        title: S.of(context).fName,
        subtitle: 'hady',
        icon: Icons.person_outline,
      ),
      EditProfileBasciModel(
        title: S.of(context).liveIn,
        subtitle: S.of(context).cairoEgypt,
        icon: Icons.info_outline,
      ),
    ];
    List<EditProfileLookModel> editProfileLookList = [
      EditProfileLookModel(
        title: S.of(context).hairColor,
        subtitle: 'black',
        icon: Icons.person_outline,
      ),
      EditProfileLookModel(
        title: S.of(context).eyeColor,
        subtitle: '',
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
            BascisListView(editProfileList: editProfileBasicList),
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
            LookListView(editProfileLookList: editProfileLookList),
          ],
        ),
      ),
    );
  }
}
