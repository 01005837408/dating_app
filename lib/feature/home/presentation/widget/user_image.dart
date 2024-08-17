import 'package:dating_app/feature/profile_screen/date/profile_cubit.dart';
import 'package:dating_app/feature/profile_screen/date/profile_state.dart';
import 'package:dating_app/feature/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserImage extends StatelessWidget {
   UserImage({
    this.height,
    this.width,
    super.key,
  });
   double? height;
  double? width;
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
    
          return Container(
            height: height ??40,
            width:width?? 40,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 25,
            ),
          );
        },
      ),
    );
  }
}