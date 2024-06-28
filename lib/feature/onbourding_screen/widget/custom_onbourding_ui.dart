import 'package:dating_app/core/routs/const_route.dart';
import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/utils/assets.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/utils/const_text.dart';
import 'package:dating_app/core/utils/styles.dart';
import 'package:dating_app/feature/authentecation/presentation/signIn/sign_in.dart';
import 'package:dating_app/feature/authentecation/presentation/signUp/sign_up.dart';
import 'package:dating_app/feature/onbourding_screen/widget/onboard_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOnboardingUI extends StatefulWidget {
  CustomOnboardingUI({
    super.key,
    required this.pageIndex,
  });
  int pageIndex;
  @override
  State<CustomOnboardingUI> createState() => _CustomOnboardingUIState();
}

class _CustomOnboardingUIState extends State<CustomOnboardingUI> {
  PageController pageController = PageController();
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final List<OnboardModel> onBoardingList = [
    OnboardModel(
      image: Assets.onbourdingImage1,
      title: ConstText.onboardTitle1,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(children: [
          verticalSpacing(30.h),
          Container(
            width: 300.h,
            height: 240.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Image.asset(onBoardingList[widget.pageIndex].image),
          ),
          verticalSpacing(65.h),
          Text(
            onBoardingList[widget.pageIndex].title,
            style: AppStyle.font21bold,
          ),
          verticalSpacing(12.h),
          Text(
            onBoardingList[widget.pageIndex].description,
            style: AppStyle.font17W400,
          ),
          verticalSpacing(40.h),
          SizedBox(
            width: 300,
            height: 50,
            child: widget.pageIndex == 2
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignInScreen()));
                    },
                    child: Text("لنبدأ",
                        style: AppStyle.font21bold
                            .copyWith(color: AppColor.kPrimaryColor)),
                  )
                : Text(
                    "التالي",
                    style: AppStyle.font21bold
                        .copyWith(color: AppColor.kPrimaryColor),
                  ),
          ),
        ]),
      ),
    );
  }
}
