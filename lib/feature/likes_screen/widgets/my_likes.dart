import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/feature/likes_screen/data/like_post_cubit.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewMyLikes extends StatelessWidget {
  const GridViewMyLikes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;

    return BlocProvider(
      create: (context) =>
          LikedPostsCubit()..loadLikedPosts(userId: currentUserId),
      child: BlocBuilder<LikedPostsCubit, List<LikedPost>>(
        builder: (context, likedPosts) {
          return GridView.builder(
            itemCount: likedPosts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1 / 1.5,
            ),
            itemBuilder: (context, index) {
              final post = likedPosts[index];
              return buildPostItem(context, post);
            },
          );
        },
      ),
    );
  }

  Widget buildPostItem(BuildContext context, LikedPost post) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.kPrimaryColor),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width:15.h, color: AppColor.kPrimaryColor),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 121.h,
                width: double.infinity,
                child: Image.network(
                  post.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      post.userName,
                      style:  TextStyle(
                          fontSize:15.sp, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Text(S.of(context).online),
                        horizontalSpacing(5),
                        Container(
                          width:10.h,
                          height: 10.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.green,
                          ),
                        ),
                         SizedBox(
                          width:20.h,
                        ),
                        const Icon(
                          Icons.favorite,
                          color: AppColor.kPrimaryColor,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
