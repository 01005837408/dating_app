import 'package:dating_app/core/utils/assets.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class GridViewPhotos extends StatelessWidget {
  final List<String> imageUrls;
  final Function(String) onLongPress;

  const GridViewPhotos({
    super.key,
    required this.imageUrls,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: imageUrls.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 2 / 2,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onLongPress: () => onLongPress(imageUrls[index]),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(27),
                border: Border.all(
                  color: AppColor.kPrimaryColor,
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(imageUrls[index], fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),
    );
  }
}