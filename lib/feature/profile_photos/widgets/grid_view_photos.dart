// grid_view_photos.dart

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class GridViewPhotos extends StatelessWidget {
  final List<String> imageUrls;
  final void Function(String) onLongPress;

  const GridViewPhotos({super.key, required this.imageUrls, required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: imageUrls.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemBuilder: (context, index) {
        final imageUrl = imageUrls[index];
        return GestureDetector(
          onLongPress: () => onLongPress(imageUrl),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error);
            },
          ),
        );
      },
    );
  }
}
