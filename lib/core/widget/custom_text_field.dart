import 'package:dating_app/core/utils/colors.dart';
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
  Color borderColor = Colors.grey, // You can pass this as a parameter to change the border color
  Color focusedBorderColor = Colors.blue, // Color for the focused border
  Color errorBorderColor = Colors.red, // Color for the error border
  Color fillColor = const Color(0xffFFFFFF), // Background color of the input field
}) {
  return Center(
    child: TextFormField(
      onChanged: onChange,
      obscureText: obscureText,
      keyboardType: inputType,
      controller: controller,
      validator: validator,
      textDirection: isArabic() ? ui.TextDirection.rtl : ui.TextDirection.ltr,
      style: const TextStyle(
        color: Colors.black,
      ),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },

      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        enabled: true,

        // Default border (when the field is not focused)
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: borderColor), // Custom border color
        ),

        // Border when the field is focused
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: AppColor.kPrimaryColor, width: 2.0), // Custom focused border color
        ),

        // Border when the field is enabled (but not focused)
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey, width: 1.5), // Custom enabled border color
        ),

        // Border when there is an error
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: errorBorderColor, width: 2.0), // Custom error border color
        ),

        // Border when the field is focused and there's an error
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: errorBorderColor, width: 2.0), // Custom focused error border color
        ),

        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: lableText,
      ),
    ),
  );
}

bool isArabic() {
  return Intl.getCurrentLocale() == "ar";
}
