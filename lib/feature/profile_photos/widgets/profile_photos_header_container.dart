import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/feature/profile_photos/data/photo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePhotosHeaderContainer extends StatelessWidget {
  const ProfilePhotosHeaderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfilePhotosCubit>(
      create: (context) => ProfilePhotosCubit()..fetchImages(),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.height / 2.2,
        decoration: BoxDecoration(
          color: AppColor.kPrimaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 60),
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 180,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 30, bottom: 20),
                child: GestureDetector(
                  onTap: () => _showBottomSheet(context, ProfilePhotosCubit()),
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
      ),
    );
  }

  void _showBottomSheet(BuildContext context , ProfilePhotosCubit profilePhotosCubit) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                profilePhotosCubit.selectImage(context , ImageSource.gallery);
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

