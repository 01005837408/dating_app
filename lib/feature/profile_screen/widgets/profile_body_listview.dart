import 'package:dating_app/core/model/profile_model.dart';
import 'package:dating_app/feature/profile_screen/widgets/profile_body_item.dart';
import 'package:flutter/material.dart';

class ProfileBodyListView extends StatelessWidget {
  const ProfileBodyListView({
    super.key,
    required this.profileList,
  });

  final List<ProfileModel> profileList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: profileList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ProfileBodyItem(profileList: profileList, index: index);
        },
      ),
    );
  }
}
