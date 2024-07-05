import 'package:dating_app/core/model/edit_profile_model.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/feature/edit_profile_screen/widgets/basics_list_view.dart';
import 'package:dating_app/feature/edit_profile_screen/widgets/calture_list_view.dart';
import 'package:dating_app/feature/edit_profile_screen/widgets/life_style_listview.dart';
import 'package:dating_app/feature/edit_profile_screen/widgets/look_list_view.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class EditProfileBodyListView extends StatelessWidget {
  const EditProfileBodyListView({super.key});

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
        subtitle: 'black',
        icon: Icons.info_outline,
      ),
      EditProfileLookModel(
        title: S.of(context).hight,
        subtitle: '175',
        icon: Icons.info_outline,
      ),
      EditProfileLookModel(
        title: S.of(context).wight,
        subtitle: '70',
        icon: Icons.info_outline,
      ),
    ];
    List<EditProfileLifeStyleModel> editProfileLifeStyleList = [
      EditProfileLifeStyleModel(
        title: S.of(context).areYousMoke,
        subtitle: 'no',
        icon: Icons.person_outline,
      ),
      EditProfileLifeStyleModel(
        title: S.of(context).maritalStatus,
        subtitle: S.of(context).single,
        icon: Icons.info_outline,
      ),
      EditProfileLifeStyleModel(
        title: S.of(context).areYouHaveKids,
        subtitle: 'no',
        icon: Icons.info_outline,
      ),
      EditProfileLifeStyleModel(
        title: S.of(context).job,
        subtitle: S.of(context).engineer,
        icon: Icons.info_outline,
      ),
      EditProfileLifeStyleModel(
        title: S.of(context).income,
        subtitle: 'no',
        icon: Icons.info_outline,
      ),
      EditProfileLifeStyleModel(
        title: S.of(context).income,
        subtitle: 'no',
        icon: Icons.info_outline,
      ),
      EditProfileLifeStyleModel(
        title: S.of(context).liveIn,
        subtitle: 'house',
        icon: Icons.info_outline,
      ),
    ];
    List<EditProfileCaltureeModel> editProfileCalutreList = [
      EditProfileCaltureeModel(
        title: S.of(context).natunality,
        subtitle: 's',
        icon: Icons.info_outline,
      ),
      EditProfileCaltureeModel(
        title: S.of(context).education,
        subtitle: 's',
        icon: Icons.info_outline,
      ),
      EditProfileCaltureeModel(
        title: S.of(context).lang,
        subtitle: 's',
        icon: Icons.info_outline,
      ),
      EditProfileCaltureeModel(
        title: S.of(context).religion,
        subtitle: 's',
        icon: Icons.info_outline,
      ),
      EditProfileCaltureeModel(
        title: S.of(context).multyWife,
        subtitle: 'ssss',
        icon: Icons.info_outline,
      ),
    ];

    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(right: 15, left: 15, top: 60, bottom: 20),
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
            Text(
              S.of(context).lifeStyle,
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
            LifeStyleListView(
                editProfileLifeStyleList: editProfileLifeStyleList),
            Text(
              S.of(context).calture,
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
            CaltureListView(editProfileCalutreList: editProfileCalutreList)
          ],
        ),
      ),
    );
  }
}
