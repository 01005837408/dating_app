import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dating_app/feature/profile_photos/data/photo_cubit.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewPhotos extends StatelessWidget {
  const GridViewPhotos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final profilePhotosCubit = context.read<ProfilePhotosCubit>();

    return StreamBuilder<List<String>>(
      stream: profilePhotosCubit.getImagesStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final images = snapshot.data ?? [];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: images.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 2 / 2,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onLongPress: () => _showDeleteDialog(
                    context, images[index], profilePhotosCubit),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27),
                    border: Border.all(
                      color: AppColor.kPrimaryColor,
                      width: 2.h,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(images[index], fit: BoxFit.contain),
                  ),
                ),
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  void _showDeleteDialog(BuildContext context, String imageUrl,
      ProfilePhotosCubit profilePhotosCubit) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Image'),
          content: const Text('Are you sure you want to delete this image?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                profilePhotosCubit.deleteImage(imageUrl);
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
