// ignore_for_file: avoid_print

import 'package:dating_app/core/utils/assets.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/utils/const_text.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'widget/custom_imageand_text_button.dart';
import 'widget/custom_onbourding_ui.dart';
import 'widget/onboard_model.dart';

class Onboard extends StatefulWidget {
  const Onboard({
    super.key,
  });

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  PageController pageController = PageController(initialPage: 0);
  int pageIndex = 0;

  List<OnboardModel> get onBoardingList => [
        OnboardModel(
          image: Assets.onbourdingImage1,
          title: S.of(context).onboardTitle1,
          description: ConstText.onbourdSubTitle1,
        ),
        OnboardModel(
          image: Assets.onbourdingImage2,
          title: ConstText.onboardTitle2,
          description: ConstText.onbourdSubTitle2,
        ),
        OnboardModel(
          image: Assets.onbourdingImage3,
          title: ConstText.onboardTitle3,
          description: ConstText.onbourdSubTitle3,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            color: AppColor.kPrimaryColor,
            child: Column(
              children: [
                const CustomImagAndTextButton(),
                Flexible(
                  child: PageView.builder(
                    itemCount: onBoardingList.length,
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index) {
                      setState(() {
                        pageIndex = index;
                      });
                     // print(pageIndex);
                    },
                    itemBuilder: (context, index) => CustomOnboardingUI(
                      pageIndex: index, pageController: pageController,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 180,
            top: 420,
            child: SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect:const ColorTransitionEffect(
                activeDotColor: Colors.white,
                dotColor: Colors.grey
                ),
            ),
          ),
        ],
      ),
    );
  }
}
