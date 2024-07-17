import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/utils/assets.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/feature/authentecation/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// Global likedPosts list and related methods
class LikedPost {
  final String imageUrl;
  final String userName;

  LikedPost({required this.imageUrl, required this.userName});
}

List<LikedPost> likedPosts = [];

bool isPostLiked(String imageUrl, String userName) {
  return likedPosts.any((post) =>
      post.imageUrl == imageUrl && post.userName == userName);
}

void togglePostLike(String imageUrl, String userName) {
  if (isPostLiked(imageUrl, userName)) {
    likedPosts.removeWhere(
        (post) => post.imageUrl == imageUrl && post.userName == userName);
  } else {
    likedPosts.add(LikedPost(imageUrl: imageUrl, userName: userName));
  }
}

class SectionCustomPost extends StatefulWidget {
  final PageController controller;
  final UserModel userModel;
  final String imageUrl;

  SectionCustomPost({
    Key? key,
    required this.controller,
    required this.userModel,
    required this.imageUrl,
  }) : super(key: key);

  @override
  _SectionCustomPostState createState() => _SectionCustomPostState();
}

class _SectionCustomPostState extends State<SectionCustomPost> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = isPostLiked(widget.imageUrl, '${widget.userModel.fname} ${widget.userModel.lname}');
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      togglePostLike(widget.imageUrl, '${widget.userModel.fname} ${widget.userModel.lname}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          Image.network(widget.imageUrl, width: double.infinity, height: 300, fit: BoxFit.fill),
          verticalSpacing(6),
          SmoothPageIndicator(
              controller: widget.controller, // PageController
              count: 3,
              effect: const WormEffect(
                dotColor: Colors.grey,
                activeDotColor: AppColor.kPrimaryColor,
              ), // your preferred effect
              onDotClicked: (index) {}),
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
                      " ${widget.userModel.lname} ${widget.userModel.fname}",
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
                InkWell(
                  onTap: () {},
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.comment),
                  ),
                ),
                horizontalSpacing(20),
                InkWell(
                  onTap: _toggleFavorite,
                  child: IconButton(
                    onPressed: _toggleFavorite,
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
  }
}
