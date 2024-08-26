import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/utils/assets.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/utils/styles.dart';
import 'package:dating_app/feature/authentecation/presentation/signIn/sign_in.dart';
import 'package:dating_app/feature/onbourding_screen/widget/onboard_model.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOnboardingUI extends StatefulWidget {
  const CustomOnboardingUI({
    super.key,
    required this.pageIndex,
  });
  final int pageIndex;
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

  @override
  Widget build(BuildContext context) {
    final List<OnboardModel> onBoardingList = [
      OnboardModel(
        image: Assets.onbourdingImage1,
        title: S.of(context).onboardTitle1,
        description: S.of(context).onbourdSubTitle1,
      ),
      OnboardModel(
        image: Assets.onbourdingImage2,
        title: S.of(context).onboardTitle2,
        description: S.of(context).onbourdSubTitle2,
      ),
      OnboardModel(
        image: Assets.onbourdingImage3,
        title: S.of(context).onboardTitle3,
        description: S.of(context).onbourdSubTitle3,
      ),
    ];

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 30.r),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          verticalSpacing(30.h),
          Container(
            width: 300.h,
            height: 240.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.r),
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
          verticalSpacing(10.h),
          SizedBox(
            width: 300.w,
            height: 50.h,
            child: widget.pageIndex == 2
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) =>const SignInScreen()));
                    },
                    child: Text(S.of(context).start,
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
