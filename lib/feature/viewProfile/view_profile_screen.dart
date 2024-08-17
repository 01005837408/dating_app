import 'package:dating_app/core/model/view_my_profile_model.dart';
import 'package:dating_app/core/utils/assets.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/feature/home/presentation/widget/home_title.dart';
import 'package:dating_app/feature/profile_screen/profile_screen.dart';
import 'package:dating_app/feature/viewProfile/widgets/view_profile_widgets.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class ViewProfile extends StatelessWidget {
  ViewProfile({super.key});
  final List<ViewMyProfileModel> viewProfileModel = [
    ViewMyProfileModel(
      image: const AssetImage(Assets.profileImage),
      title: 'Eman',
      subtitle: 'Hi, how are you',
    ),
    ViewMyProfileModel(
      image: const AssetImage(Assets.profileImage),
      title: 'Eman',
      subtitle: 'Hi, how are you',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      // ignore: prefer_const_constructors
      child: Scaffold(
         // appBar: appBar(context),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                 Container(
                  color: AppColor.kPrimaryColor,
                  child: HomeTitle(
                    text: S.of(context).viewMyprofile,
                    iconButton: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: Column(
                    children: [
                      TabBar(
                        automaticIndicatorColorAdjustment: true,
                        indicatorPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        unselectedLabelColor: Colors.blue,
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: AppColor.kPrimaryColor,
                        labelStyle: const TextStyle(fontSize: 20),
                        dividerColor: AppColor.kPrimaryColor,
                        dividerHeight: 0,
                        indicatorWeight: 5,
                        indicatorColor: AppColor.kPrimaryColor,
                        tabs: [
                          Tab(
                            text: S.of(context).viewMyprofile,
                          ),
                          Tab(text: S.of(context).viewOtherProfile),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 45),
                          child: TabBarView(
                            children: [
                              ViewMyProfile(viewMyProfileModel: viewProfileModel),
                              ViewMyProfile(viewMyProfileModel: viewProfileModel),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ))),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColor.kPrimaryColor,
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 8, bottom: 8),
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const ProfileScreen(),
              ),
            ),
            child: const CircleAvatar(
              backgroundImage: AssetImage(Assets.profileImage),
            ),
          ),
        )
      ],
      title: Text(
        S.of(context).viewMyprofile,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
