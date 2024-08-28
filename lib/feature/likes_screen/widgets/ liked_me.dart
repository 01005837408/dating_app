import 'package:dating_app/feature/likes_screen/data/like_post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/utils/assets.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/feature/likes_screen/data/model_liked_post.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewLikesByAnotherUser extends StatelessWidget {
  final String userId;

  const GridViewLikesByAnotherUser({Key? key, required this.userId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LikedPostsCubit(),
      child: BlocBuilder<LikedPostsCubit, List<LikedPost>>(
        builder: (context, likedPosts) {
          return GridView.builder(
            itemCount: likedPosts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1 / 1.2,
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
                  fit: BoxFit.cover,
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
