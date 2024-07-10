import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/widget/custom_appbar.dart';
import 'package:dating_app/feature/profile_photos/data/photo_cubit.dart';
import 'package:dating_app/feature/profile_photos/widgets/grid_view_photos.dart';
import 'package:dating_app/feature/profile_photos/widgets/profile_photos_header_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePhotosScreen extends StatelessWidget {
  const ProfilePhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<ProfilePhotosCubit>(
          create: (context) => ProfilePhotosCubit()..fetchImages(),
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
                  text: ' الصور',
                ),
                verticalSpacing(15),
                const ProfilePhotosHeaderContainer(),
                verticalSpacing(20),
                const Divider(
                  indent: 50,
                  endIndent: 50,
                  color: AppColor.kPrimaryColor,
                  thickness: 4,
                ),
                const GridViewPhotos(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
