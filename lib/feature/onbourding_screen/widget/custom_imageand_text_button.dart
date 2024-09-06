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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              _showLanguageDialog(context); // Show language selection dialog
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SignInScreen()));
              },
              child: Text(
                S.of(context).skip,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }

  // Method to show the language selection dialog
  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).choose_language),
          content: Text(S.of(context).select_language_preference),
          actions: [
            TextButton(
              onPressed: () {
                // Set language to Arabic
                BlocProvider.of<AppCubit>(context).setLangAr();
                Navigator.pop(context); // Close the dialog
              },
              child: Text(S.of(context).arabic),
            ),
            TextButton(
              onPressed: () {
                // Set language to English
                BlocProvider.of<AppCubit>(context).setLangEn();
                Navigator.pop(context); // Close the dialog
              },
              child: Text(S.of(context).english),
            ),
          ],
        );
      },
    );
  }
}
