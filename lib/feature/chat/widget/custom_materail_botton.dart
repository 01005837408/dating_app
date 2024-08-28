// ignore_for_file: must_be_immutable

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
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: MaterialButton(
        //constraints: BoxConstraints(maxwidth:330.h , maxHeight: double.infinity ),
        height: 50.h,
        minWidth: 330.h,

        // padding: EdgeInsets.only(left: 10),

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(bourderRedias ?? 50)),
        color: backgroundBottonsColors,
        onPressed: onPressed,
        child: Text(text,
            style:  TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
            )),
      ),
    );
  }
}
