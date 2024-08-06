import 'package:dating_app/feature/home/presentation/screens/comment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/utils/assets.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/feature/authentecation/model/user_model.dart';
import 'package:dating_app/feature/likes_screen/data/like_post_cubit.dart';
import 'package:dating_app/feature/likes_screen/data/model_liked_post.dart';
// Import the new comments screen

class SectionCustomPost extends StatelessWidget {
  final PageController controller;
  final UserModel userModel;
  final String imageUrl;
  final String postId; // Add postId to identify the post

  SectionCustomPost({
    Key? key,
    required this.controller,
    required this.userModel,
    required this.imageUrl,
    required this.postId, // Add postId to the constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LikedPostsCubit()..loadLikedPosts(),
      child: BlocBuilder<LikedPostsCubit, List<LikedPost>>(
        builder: (context, likedPosts) {
          bool isFavorite = likedPosts.any((post) => post.imageUrl == imageUrl && post.userName == '${userModel.fname} ${userModel.lname}');

          return Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                Image.network(imageUrl, width: double.infinity, height: 300, fit: BoxFit.fill),
                verticalSpacing(6),
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: const WormEffect(
                    dotColor: Colors.grey,
                    activeDotColor: AppColor.kPrimaryColor,
                  ),
                  onDotClicked: (index) {},
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            " ${userModel.lname} ${userModel.fname}",
                            style: const TextStyle(color: AppColor.kPrimaryColor),
                          ),
                          horizontalSpacing(10),
                          Image.asset(
                            Assets.profileImage,
                            width: 40,
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
 // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => CommentsScreen(postId: postId),
                          //   ),
                          // );                          //     builder: (context) => CommentsScreen(postId: postId),
                          //   ),
                          // );
                        },
                        icon: const Icon(Icons.comment),
                      ),
                      horizontalSpacing(20),
                      InkWell(
                        onTap: () {
                          context.read<LikedPostsCubit>().togglePostLike(imageUrl, '${userModel.fname} ${userModel.lname}');
                        },
                        child: IconButton(
                          onPressed: () {
                            context.read<LikedPostsCubit>().togglePostLike(imageUrl, '${userModel.fname} ${userModel.lname}');
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: isFavorite ? Colors.red : Colors.grey,
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("23. Egypt"),
                          Text("online"),
                        ],
                      ),
                    ],
                  ),
                ),
                verticalSpacing(30),
              ],
            ),
          );
        },
      ),
    );
  }
}
