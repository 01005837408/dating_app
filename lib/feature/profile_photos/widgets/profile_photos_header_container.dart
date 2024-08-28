import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/feature/profile_photos/data/photo_cubit.dart';
import 'package:dating_app/feature/profile_screen/date/profile_cubit.dart';
import 'package:dating_app/feature/profile_screen/date/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePhotosHeaderContainer extends StatelessWidget {
  const ProfilePhotosHeaderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final profilePhotosCubit = context.read<ProfilePhotosCubit>();

    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          String imageUr1l =
              "https://as1.ftcdn.net/v2/jpg/02/43/12/34/1000_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg";

          if (state is ProfileLoaded) {
            imageUr1l = state.imageUrl;
          }
          return Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: MediaQuery.of(context).size.height / 2.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  imageUr1l,
                ),
                fit: BoxFit.cover,
              ),
              color: AppColor.kPrimaryColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Column(
              children: [
                // const Padding(
                //   padding: EdgeInsets.only(top: 60),
                //   child: Icon(
                //     Icons.camera_alt,
                //     color: Colors.white,
                //     size: 180,
                //   ),
                // ),
                SizedBox(
                  height: 270.h,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30, bottom: 20),
                    child: GestureDetector(
                      onTap: () =>
                          _showBottomSheet(context, profilePhotosCubit),
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: const Icon(
                          Icons.add,
                          color: AppColor.kPrimaryColor,
                          size: 60,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showBottomSheet(
      BuildContext context, ProfilePhotosCubit profilePhotosCubit) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                profilePhotosCubit.selectImage(context, ImageSource.gallery);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: const Text('Camera'),
              onTap: () {
                profilePhotosCubit.selectImage(context, ImageSource.camera);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
