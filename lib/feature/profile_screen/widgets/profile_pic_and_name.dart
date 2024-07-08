import 'package:dating_app/feature/authentecation/data/cubit_sign_up/auth_sign_up_cubit.dart';
import 'package:dating_app/feature/authentecation/data/cubit_sign_up/auth_sign_up_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:dating_app/feature/authentecation/model/user_model.dart';

class ProfilePictureAndName extends StatelessWidget {
   ProfilePictureAndName({Key? key}) : super(key: key);
final myUid = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (context) => UserCubit()..fetchUser(myUid),
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoaded) {
            UserModel user = state.user;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Your UI code here to display user's profile picture and name
                SizedBox(height: 75.h,),
                Center(
                  child: Text(
                    '${user.fname} ${user.lname}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),
                ),
                Text(
                  'ID : ${user.uid}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            );
          } else {
            return const CircularProgressIndicator(); // Loading state
          }
        },
      ),
    );
  }
}
