import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/feature/home/presentation/widget/user_image.dart';
import 'package:dating_app/feature/likes_screen/widgets/%20liked_me.dart';
import 'package:dating_app/feature/likes_screen/widgets/my_likes.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../home/presentation/widget/home_title.dart';

class LikesScreen extends StatelessWidget {
  const LikesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        //appBar: appBar(context),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: AppColor.kPrimaryColor,
                  child: HomeTitle(
                    text: S.of(context).likes,
                    iconButton: IconButton(
                      icon: const Icon(Icons.arrow_back , color: Colors.white,),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: Column(
                    children: [
                      TabBar(
                        indicatorPadding:
                             EdgeInsets.symmetric(horizontal: 10),
                        unselectedLabelColor: Color(0xfffe3c72).withOpacity(0.698),
                        
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: AppColor.kPrimaryColor,
                        labelStyle:  TextStyle(fontSize: 18.sp),
                        dividerColor: AppColor.kPrimaryColor,
                        dividerHeight: 0.h,
                        indicatorWeight: 5,
                        indicatorColor: AppColor.kPrimaryColor,
                        tabs: [
                          Tab(text: S.of(context).likeMe),
                          Tab(text: S.of(context).likeOthers),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 45),
                          child: TabBarView(
                            children: [
                              GridViewMyLikes(),
                              GridViewLikesByAnotherUser(userId: currentUserId),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColor.kPrimaryColor,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back),
      ),
      actions: [UserImage()],
      title: Text(
        S.of(context).likes,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
