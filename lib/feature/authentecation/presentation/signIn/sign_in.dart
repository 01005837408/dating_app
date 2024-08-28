import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'dart:ui' as ui;
import 'package:dating_app/feature/authentecation/presentation/signIn/widget/refactor_text_field_sign_in.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  // TextEditingController fNameController = TextEditingController();
  bool isArabic() {
    return Intl.getCurrentLocale() == "ar";
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: isArabic() ? ui.TextDirection.rtl : ui.TextDirection.ltr,
      child: Scaffold(
          backgroundColor: AppColor.kPrimaryColor,
          body: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(left: 20.0, top: 16),
              //   child: Align(
              //     alignment: Alignment.topLeft,
              //     child: Container(
              //       height:50.h,
              //       width:50.h,
              //       decoration: const BoxDecoration(
              //         color: Colors.grey,
              //         shape: BoxShape.circle,
              //       ),
              //       child: Center(
              //         child: IconButton(
              //           onPressed: () {},
              //           icon: const Icon(
              //             Icons.arrow_back,
              //             size: 30,
              //             color: Colors.white,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              verticalSpacing(60.h),
              Expanded(
                child: Container(
                  // height:639.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.r),
                        topRight: Radius.circular(40.r),
                      )),
                  child: Padding(
                    padding: EdgeInsets.all(20.0.r),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          verticalSpacing(10),
                          Text(
                            S.of(context).loginTitle,
                            style: TextStyle(
                                fontSize: 24.sp.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromARGB(255, 46, 40, 40)),
                          ),
                          verticalSpacing(80.h),
                          RefactorCustomTextFormFieldSignIn(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
