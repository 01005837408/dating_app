import 'package:dating_app/feature/settings_profile/settings_Screen_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.widget,
      this.text,
      this.icon,
      this.iconColor,
      required this.backgroundColor,
      this.onTap});
  final Widget widget;
  final String? text;
  final Icon? icon;
  final Color? iconColor;
  final Color backgroundColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h.h,
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: widget),
            const Spacer(),
            Text(
              text ?? '',
              textAlign: TextAlign.right,
              style:  TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 24.sp),
            ),
            const Spacer(),
            GestureDetector(
              onTap: onTap,
              child: Icon(
                icon?.icon,
                color: iconColor,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
