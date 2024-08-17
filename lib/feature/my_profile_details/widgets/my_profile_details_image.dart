import 'package:dating_app/core/utils/assets.dart';
import 'package:dating_app/feature/profile_screen/date/profile_state.dart';
import 'package:dating_app/feature/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../profile_screen/date/profile_cubit.dart';

class MyProfileDetailsImage1 extends StatelessWidget {
  const MyProfileDetailsImage1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.profileImage,
      height: MediaQuery.of(context).size.height / 2.6,
      width: MediaQuery.of(context).size.height / 1,
      fit: BoxFit.cover,
    );
  }
}
class MyProfileDetailsImage extends StatelessWidget {
  MyProfileDetailsImage({
    this.height,
    this.width,
    this.container,
    super.key,
  });
  double? height;
  double? width;
  Widget? container;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const ProfileScreen(),
        ),
      ),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          String imageUrl =
              "https://as1.ftcdn.net/v2/jpg/02/43/12/34/1000_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg";

          if (state is ProfileLoaded) {
            imageUrl = state.imageUrl;
          }

          return  Container(
            height: MediaQuery.of(context).size.height / 2.6,
      width: MediaQuery.of(context).size.height / 1,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child:Image.network(imageUrl, fit: BoxFit.cover,) ,
          );
        },
      ),
    );
  }
}

