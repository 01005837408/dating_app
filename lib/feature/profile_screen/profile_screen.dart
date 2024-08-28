import 'package:dating_app/feature/profile_screen/date/profile_cubit.dart';
import 'package:dating_app/feature/profile_screen/date/profile_state.dart';
import 'package:dating_app/feature/profile_screen/widgets/Profile_appBar.dart';
import 'package:dating_app/feature/profile_screen/widgets/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  void _showImageSourceActionSheet(BuildContext context, ProfileCubit profileCubit) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  profileCubit.pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  profileCubit.pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..initialize(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                 Column(
                  children: [
                   const ProfileAppBar(height: 130),
                    ProfileBody(),
                  ],
                ),
                Positioned(
                  top: 80.h,
                  left: MediaQuery.of(context).size.width / 3.3,
                  child: BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      return Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage: state is ProfileImageSelected
                                ? FileImage(state.image)
                                : state is ProfileLoaded
                                    ? NetworkImage(state.imageUrl)
                                    : const NetworkImage(
                                        "https://as1.ftcdn.net/v2/jpg/02/43/12/34/1000_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg",
                                      ) as ImageProvider,
                            radius: 80,
                          ),
                          Positioned(
                            right: 5,
                            top: 115,
                            child: InkWell(
                              onTap: () => _showImageSourceActionSheet(
                                  context, BlocProvider.of<ProfileCubit>(context)),
                              child: const CircleAvatar(
                                radius: 18,
                                backgroundColor: Color(0xFFEDB2C2),
                                child: Icon(Icons.edit, color: Colors.white, size: 18),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
