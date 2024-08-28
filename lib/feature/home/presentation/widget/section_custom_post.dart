import 'package:dating_app/feature/my_profile_details/my_profile_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/feature/authentecation/model/user_model.dart';
import 'package:dating_app/feature/likes_screen/data/like_post_cubit.dart';

class SectionCustomPost extends StatelessWidget {
  final PageController controller = PageController();
  final UserModel userModel;
  final List<String> imageUrls;
  final String postId;

  SectionCustomPost({
    Key? key,
    required this.userModel,
    required this.imageUrls,
    required this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrls.isEmpty) {
      return const SizedBox.shrink(); // Return an empty widget if no images
    }

    return BlocProvider(
      create: (context) =>
          LikedPostsCubit()..loadLikedPosts(userId: userModel.uid),
      child: BlocBuilder<LikedPostsCubit, List<LikedPost>>(
        builder: (context, likedPosts) {
          bool isFavorite = likedPosts.any((post) =>
              post.imageUrl == imageUrls[0] &&
              post.userName == '${userModel.fname} ${userModel.lname}');

          return Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  child: PageView.builder(
                    controller: controller,
                    itemCount: imageUrls.length,
                    itemBuilder: (context, index) => Image.network(
                      imageUrls[index],
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                verticalSpacing(6),
                SmoothPageIndicator(
                  controller: controller,
                  count: imageUrls.length,
                  effect: const WormEffect(
                    dotColor: Colors.grey,
                    activeDotColor: AppColor.kPrimaryColor,
                  ),
                  onDotClicked: (index) {},
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => MyProfileDetailsScreen(
                              
                            )));
                  },
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
                            " ${userModel.fname} ${userModel.lname}",
                            style:
                                const TextStyle(color: AppColor.kPrimaryColor),
                          ),
                          horizontalSpacing(10),
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: userModel.profilePicture.isNotEmpty
                                ? NetworkImage(userModel.profilePicture)
                                : const AssetImage(
                                        'assets/images/Home Screen-image.jpg')
                                    as ImageProvider,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.comment),
                      ),
                      horizontalSpacing(20),
                      InkWell(
                        onTap: () {
                          context.read<LikedPostsCubit>().togglePostLike(
                                userModel.uid,
                                postId,
                                imageUrls[0],
                                '${userModel.fname} ${userModel.lname}',
                              );
                        },
                        child: IconButton(
                          onPressed: () {
                            context.read<LikedPostsCubit>().togglePostLike(
                                  userModel.uid,
                                  postId,
                                  imageUrls[0],
                                  '${userModel.fname} ${userModel.lname}',
                                );
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
