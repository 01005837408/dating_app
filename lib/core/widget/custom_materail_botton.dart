// ignore_for_file: must_be_immutable

import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMaterialBottons extends StatelessWidget {
  CustomMaterialBottons({
    this.backgroundBottonsColors,
    this.bourderRedias,
    required this.onPressed,
    required this.text,
    super.key,
  });
  Function() onPressed;
  Color? backgroundBottonsColors;
  String text;
  double? bourderRedias;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      //constraints: BoxConstraints(maxwidth:330.h , maxHeight: double.infinity ),
      height: 60.h,
     minWidth: 330.w,


      // padding: EdgeInsets.only(left: 10),

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(bourderRedias ?? 50)),
      color: backgroundBottonsColors ?? AppColor.kPrimaryColor,
      onPressed: onPressed,
      child: Text(text,
          style:  TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize:20.sp,
          )),
    );
  }
}
