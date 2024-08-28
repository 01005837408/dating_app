import 'package:dating_app/core/utils/assets.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/utils/const_text.dart';
import 'package:dating_app/core/utils/styles.dart';
import 'package:dating_app/feature/onbourding_screen/onboard.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Onboard()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kPrimaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 200.h.h),
              Center(
                  child: Image.asset(
                Assets.logo,
              )),
              SizedBox(
                height: 10.h.h,
              ),
              Text(
                S.of(context).titleSplash,
                // ConstText.titleSplash,
                style: AppStyle.font31bold,
              ),
              SizedBox(
                height: 250.h.h,
              ),
              Text(
                S.of(context).subTitleSplashScreen,
                //  ConstText.subTitleSplashScreen,
                style: AppStyle.font21bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
