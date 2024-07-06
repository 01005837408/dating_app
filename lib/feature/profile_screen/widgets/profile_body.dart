import 'package:dating_app/core/model/profile_model.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/feature/my_profile_details/my_profile_details_screen.dart';
import 'package:dating_app/feature/profile_photos/profile_photos_screen.dart';
import 'package:dating_app/feature/profile_screen/widgets/profile_body_listview.dart';
import 'package:dating_app/feature/profile_screen/widgets/profile_pic_and_name.dart';
import 'package:dating_app/feature/profile_screen/widgets/profile_white_container.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProfileModel> profileList = [
      ProfileModel(
        icon: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.white,
          ),
        ),
        iconButton: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.person,
            color: Colors.white,
            size: 37,
          ),
        ),
        text: S.of(context).myProfile,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyProfileDetailsScreen(),
            ),
          );
        },
      ),
      ProfileModel(
        icon: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.white,
          ),
        ),
        iconButton: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.camera_alt,
            color: Colors.white,
            size: 37,
          ),
        ),
        text: S.of(context).myPhotos,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  ProfilePhotosScreen(),
            ),
          );
        },
      ),
    ];

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1,
      decoration: const BoxDecoration(
        color: AppColor.kPrimaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          const ProfilePictureAndName(),
          ProfileBodyListView(profileList: profileList),
          const WhitContainerProfile(),


        ],
      ),
    );
  }
}
