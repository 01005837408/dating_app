// ignore_for_file: prefer_const_constructors


import 'package:dating_app/feature/profile_photos/widgets/grid_view_photos.dart';
import 'package:dating_app/feature/profile_photos/widgets/profile_photos_header_container.dart';
import 'package:flutter/material.dart';
import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/widget/custom_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'data/profile_Photos_Cubit.dart';
import 'data/profile_photos_states.dart';

class ProfilePhotosScreen extends StatelessWidget {
class ProfilePhotosScreen extends StatelessWidget {
  const ProfilePhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfilePhotosCubit()..fetchImages(),
      child: const ProfilePhotosView(),
    );
  }
}

class ProfilePhotosView extends StatelessWidget {
  const ProfilePhotosView({super.key});

  void _showDeleteDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Image'),
        content: Text('Are you sure you want to delete this image?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<ProfilePhotosCubit>().deleteImage(imageUrl);
            },
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (bottomSheetContext) {
        return BlocProvider.value(
          value: context.read<ProfilePhotosCubit>(),
          child: Container(
            color: AppColor.kPrimaryColor,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Pick Image From Gallery or Camera", style: TextStyle(fontSize: 20, color: Colors.white)),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    context.read<ProfilePhotosCubit>().pickImage(ImageSource.gallery);
                  },
                  child: Text("Pick Image From Gallery"),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    context.read<ProfilePhotosCubit>().pickImage(ImageSource.camera);
                  },
                  child: Text("Pick Image From Camera"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAppBar(
                widget: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: AppColor.kPrimaryColor,
                text: 'الصور',
              ),
              verticalSpacing(15),
              ProfilePhotosHeaderContainer(
                onCameraTap: () => _showBottomSheet(context), parentContext: context,
              ),
              verticalSpacing(20),
              const Divider(
                indent: 50,
                endIndent: 50,
                color: AppColor.kPrimaryColor,
                thickness: 4,
              ),
              BlocBuilder<ProfilePhotosCubit, ProfilePhotosState>(
                builder: (context, state) {
                  if (state is ProfilePhotosLoading) {
                    return CircularProgressIndicator();
                  } else if (state is ProfilePhotosLoaded) {
                    return GridViewPhotos(imageUrls: state.imageUrls, onLongPress: (imageUrl) => _showDeleteDialog(context, imageUrl));
                  } else if (state is ProfilePhotosError) {
                    return Text(state.message);
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
