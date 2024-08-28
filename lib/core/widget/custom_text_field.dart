import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;
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
  bool obscureText = false,
  TextDirection? textDirection,
  //Function()? suffixPressed,
}) {
  return Center(
    child: TextFormField(
      //  onTap: suffixPressed,

      onChanged: onChange,
      obscureText: obscureText,
      keyboardType: inputType,
      controller: controller,
      validator: validator,
      textDirection: isArabic() ? ui.TextDirection.rtl : ui.TextDirection.ltr,
      
      style:const TextStyle(
        color: Colors.black,
      ),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },

      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffFFFFFF),
        enabled: true,
        // constraints: const BoxConstraints(maxWidth: 320, maxHeight: 55),
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
  bool isArabic() {
    return Intl.getCurrentLocale() == "ar";
  }
