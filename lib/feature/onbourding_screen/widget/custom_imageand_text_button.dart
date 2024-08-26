import 'package:dating_app/core/cubit/app_cubit.dart';
import 'package:dating_app/core/utils/assets.dart';
import 'package:dating_app/feature/authentecation/presentation/signIn/sign_in.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImagAndTextButton extends StatefulWidget {
  const CustomImagAndTextButton({
    super.key,
  });

  @override
  State<CustomImagAndTextButton> createState() =>
      _CustomImagAndTextButtonState();
}

class _CustomImagAndTextButtonState extends State<CustomImagAndTextButton> {
  bool isToggled = false;
  void _toggle() {
    setState(() {
      isToggled = !isToggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(20.r),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              _toggle();
              if (isToggled) {
                BlocProvider.of<AppCubit>(context).setLangEn();
              } else {
                BlocProvider.of<AppCubit>(context).setLangAr();
              }
            },
            child: CircleAvatar(
              radius: 25.r,
              backgroundColor: Colors.white,
              child: Image.asset(
                Assets.onbourdingImage,
                height: 32.h,
                width: 32.w,
              ),
            ),
          ),
          const Spacer(),
          TextButton(
              onPressed: () {
                // print('object');
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SignInScreen()));
                // Navigator.of(context).pushReplacementNamed(Routs.loginScreen);
              },
              child: Text(
                S.of(context).skip,
                style:  TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }
}
