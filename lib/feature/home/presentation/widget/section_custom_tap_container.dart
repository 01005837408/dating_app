import 'package:dating_app/core/utils/assets.dart';
import 'package:dating_app/core/utils/const_text.dart';
import 'package:dating_app/feature/home/presentation/widget/custom_tap_container.dart';
import 'package:flutter/material.dart';

class SectionCustomTapContainer extends StatelessWidget {
  const SectionCustomTapContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTapContainer(
              onTap: () {},
              image: Assets.loveImageTitle,
              text: ConstText.matwafik,
            ),
            CustomTapContainer(
                onTap: () {},
                image: Assets.commentImage,
                text: ConstText.connectInt),
            CustomTapContainer(
                onTap: () {},
                image: Assets.commentImage,
                text: ConstText.inPlace),
            //  horizontalSpacing(18)
          ],
        ),
      ),
    );
  }
}
