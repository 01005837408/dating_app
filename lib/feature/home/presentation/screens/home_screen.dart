import 'package:dating_app/core/spacing/spacing.dart';

import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/feature/home/presentation/widget/custom_post.dart';
import 'package:dating_app/feature/home/presentation/widget/home_title.dart';
import 'package:dating_app/feature/home/presentation/widget/section_custom_tap_container.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.kPrimaryColor,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    HomeTitle(),
                    verticalSpacing(20),
                    const SectionCustomTapContainer(),
                    verticalSpacing(20),
                    // Image.asset(Assets.postImage , height:320.h,width: double.infinity,fit:BoxFit.cover ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomPost(),
            )
          ],
        ));
  }
}
