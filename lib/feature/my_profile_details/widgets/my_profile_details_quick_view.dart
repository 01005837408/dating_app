import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class QuickViewInMyProfile extends StatelessWidget {
  const QuickViewInMyProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).work,
              style:
                  const TextStyle(color: AppColor.kPrimaryColor, fontSize: 20),
            ),
            Text(
              S.of(context).engineer,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              S.of(context).maritalStatus,
              style:
                  const TextStyle(color: AppColor.kPrimaryColor, fontSize: 20),
            ),
            Text(
              S.of(context).single,
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).education,
              style:
                  const TextStyle(color: AppColor.kPrimaryColor, fontSize: 20),
            ),
            Text(S.of(context).engineerUniversity),
            const SizedBox(
              height: 8,
            ),
            Text(
              S.of(context).religion,
              style:
                  const TextStyle(color: AppColor.kPrimaryColor, fontSize: 20),
            ),
            Text(S.of(context).Muslim),
          ],
        ),
      ],
    );
  }
}
