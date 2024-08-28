import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/utils/const_text.dart';
import 'package:dating_app/core/utils/styles.dart';
import 'package:dating_app/feature/authentecation/presentation/signIn/sign_in.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(S.of(context).doHaveAcount,
            style: TextStyle(
              fontSize: 14.sp.sp,
              fontWeight: FontWeight.w400,
            )

            //AppStyle.font17W400.copyWith(color: Colors.black),
            ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => SignInScreen(),
              ));
            },
            child: Text(
              S.of(context).enterLogin,
              style: TextStyle(
                fontSize: 17.sp.sp,
                fontWeight: FontWeight.w400,
              )
                  // Text.font17W400
                  .copyWith(color: AppColor.kPrimaryColor),
            ))
      ],
    );
  }
}
