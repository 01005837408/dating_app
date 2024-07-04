
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingGrid extends StatelessWidget {
  const ShimmerLoadingGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4, // The number of shimmer boxes you want to show
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 2 / 2,
        ),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: const Color.fromARGB(255, 236, 69, 69)!,
            highlightColor: Color.fromARGB(255, 105, 23, 160)!,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(27),
              ),
            ),
          );
        },
      ),
    );
  }
}
