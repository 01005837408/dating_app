// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget CustomTextFormField({
  String? hintText,
  String? lableText,
  Icon? prefixIcon,
  Widget? suffixIcon,
  TextEditingController? controller,
  TextInputType? inputType,
  String? Function(String?)? validator,
  String? Function(String?)? onChange,
  String? Function()? suffixPressed,
  bool passwordVisible = false,
  //Function()? suffixPressed,
}) {
  return Center(
    child: TextFormField(
      //  onTap: suffixPressed,

      onChanged: onChange,
      obscureText: passwordVisible,
      keyboardType: inputType,
      controller: controller,
      validator: validator,
      style: const TextStyle(
        color: Colors.black,
      ),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },

      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffFFFFFF),
        enabled: true,
        // constraints: const BoxConstraints(maxwidth:320.h, maxheight:55.h),
        //  labelStyle: StylesApp.font14Mediam,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        prefixIcon: prefixIcon,
        prefixIconColor: Colors.white,
        suffixIconColor: Colors.white,
        suffixIcon: suffixIcon,
        // prefixStyle: StylesApp.font14Mediam,
        labelText: lableText,
      ),
    ),
  );
}
