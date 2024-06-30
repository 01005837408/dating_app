import 'package:dating_app/core/model/view_my_profile_model.dart';
import 'package:dating_app/core/utils/assets.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/utils/const_text.dart';
import 'package:dating_app/feature/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';

class ViewProfile extends StatelessWidget {
  ViewProfile({super.key});
  List<ViewMyProfileModel> viewProfileModel = [
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
          appBar: AppBar(
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
            title: const Text(
              "View Profile",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                children: [
                  const TabBar(
                    automaticIndicatorColorAdjustment: true,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                    unselectedLabelColor: Colors.blue,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: AppColor.kPrimaryColor,
                    labelStyle: TextStyle(fontSize: 20),
                    dividerColor: AppColor.kPrimaryColor,
                    dividerHeight: 0,
                    indicatorWeight: 5,
                    indicatorColor: AppColor.kPrimaryColor,
                    tabs: [
                      // Tab(
                      //   text: ConstText.viewMyprofile,
                      // ),
                      // Tab(text: ConstText.viewOtherProfile),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 45),
                      child: TabBarView(
                        children: [
                          ViewMyProfile(viewMyProfileModel: viewProfileModel),
                          const Text("Photos"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ))),
    );
  }
}

class ViewMyProfile extends StatelessWidget {
  const ViewMyProfile({super.key, required this.viewMyProfileModel});
  final List<ViewMyProfileModel> viewMyProfileModel;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(
        color: AppColor.kPrimaryColor,
      ),
      itemCount: viewMyProfileModel.length,
      itemBuilder: (context, index) => ListTile(
        leading: CircleAvatar(
          backgroundImage: viewMyProfileModel[index].image,
        ),
        title: Text(
          viewMyProfileModel[index].title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        subtitle: Text(viewMyProfileModel[index].subtitle),
      ),
    );
  }
}
