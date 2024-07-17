import 'package:dating_app/feature/likes_screen/data/model_liked_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/utils/assets.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/generated/l10n.dart';

class GridViewMyLikes extends StatelessWidget {
  const GridViewMyLikes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikedPostsCubit, List<LikedPost>>(
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
                      border: Border.all(width: 1.5, color: AppColor.kPrimaryColor),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        height: 121,
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
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                Text(S.of(context).online),
                                horizontalSpacing(5),
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.green,
                                  ),
                                ),
                                SizedBox(width: 20,),
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
          },
        );
      },
    );
  }
}
