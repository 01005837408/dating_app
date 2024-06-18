import 'package:dating_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required String message}){
  Fluttertoast.showToast(
    msg:message,
    backgroundColor: AppColor.kPrimaryColor,
    textColor: Colors.white,
  );
}