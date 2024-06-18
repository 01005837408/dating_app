// ignore_for_file: must_be_immutable

import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/utils/styles.dart';
import 'package:flutter/material.dart';


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
        //constraints: BoxConstraints(maxWidth: 330 , maxHeight: double.infinity ),
        height: 50,
        minWidth: 330,

        // padding: EdgeInsets.only(left: 10),

        shape: RoundedRectangleBorder(  borderRadius:  BorderRadius.circular(bourderRedias ?? 50)),
        color: backgroundBottonsColors ?? AppColor.kPrimaryColor,
        onPressed: onPressed,
        child: Text(text, style:const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        )),
      ),
    );
  }
}