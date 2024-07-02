import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/utils/const_text.dart';
import 'package:dating_app/core/utils/styles.dart';
import 'package:dating_app/feature/authentecation/presentation/signIn/sign_in.dart';
import 'package:flutter/material.dart';

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
        Text(
          ConstText.doHaveAcount,
          style:
              AppStyle.font17W400.copyWith(color: Colors.black),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(
                builder: (context) => SignInScreen(),
              ));
            },
            child: Text(
              ConstText.enterLogin,
              style: AppStyle.font17W400
                  .copyWith(color: AppColor.kPrimaryColor),
            ))
      ],
    );
  }
}
