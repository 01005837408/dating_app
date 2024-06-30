import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/utils/const_text.dart';
import 'package:flutter/material.dart';

class DoneContainerText extends StatelessWidget {
  const DoneContainerText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade200,
          ),
          child: const Center(
              child: Text(
            ConstText.done,
            style: TextStyle(fontSize: 25, color: AppColor.kPrimaryColor),
          )),
        ),
      ),
    );
  }
}
