import 'package:dating_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvancedTextWithDivider extends StatelessWidget {
  const AdvancedTextWithDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 10, left: 20),
          child: Text(
            S.of(context).advancedFiltters,
            style:  TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        const Divider(
          endIndent: 60,
          indent: 60,
          thickness: 3,
          color: Colors.white,
        ),
      ],
    );
  }
}
