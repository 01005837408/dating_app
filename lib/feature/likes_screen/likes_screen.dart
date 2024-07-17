import 'package:dating_app/core/utils/assets.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/feature/likes_screen/data/model_liked_post.dart';
import 'package:dating_app/feature/likes_screen/widgets/%20liked_me.dart';
import 'package:dating_app/feature/likes_screen/widgets/my_likes.dart';
import 'package:dating_app/feature/profile_screen/profile_screen.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikesScreen extends StatelessWidget {
  const LikesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      // ignore: prefer_const_constructors
      child: BlocProvider(
        create: (context) => LikedPostsCubit(currentUserName:  FirebaseAuth.instance.currentUser!.uid)..loadLikedPosts(),
        child: BlocBuilder<LikedPostsCubit, List<LikedPost>>(
          
          builder: (context, state) => 
           Scaffold(
              appBar: appBar(context),
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
                      TabBar(
                        // automaticIndicatorColorAdjustment: true,
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
                            text: S.of(context).likeMe,
                          ),
                          Tab(text: S.of(context).likeOthers),
                        ],
                      ),
                         Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 45),
                          child:  TabBarView(
                            children: [
                              GridViewMyLikes(),
                              GridViewLikesByAnotherUser(
                                currentUserName: FirebaseAuth.instance.currentUser!.uid,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ))),
        ),
      ),
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
        S.of(context).likes,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
