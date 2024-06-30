import 'package:dating_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class QuickViewInMyProfile extends StatelessWidget {
  const QuickViewInMyProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'العمل',
              style: TextStyle(color: AppColor.kPrimaryColor, fontSize: 20),
            ),
            Text('مهندس برمجيات'),
            SizedBox(
              height: 8,
            ),
            Text(
              'الحالة الزوجية',
              style: TextStyle(color: AppColor.kPrimaryColor, fontSize: 20),
            ),
            Text('اعزب'),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'التعليم',
              style: TextStyle(color: AppColor.kPrimaryColor, fontSize: 20),
            ),
            Text('كلية الذكاء الاصطناعي '),
            SizedBox(
              height: 8,
            ),
            Text(
              'الديانه',
              style: TextStyle(color: AppColor.kPrimaryColor, fontSize: 20),
            ),
            Text('مسلم'),
          ],
        ),
      ],
    );
  }
}
