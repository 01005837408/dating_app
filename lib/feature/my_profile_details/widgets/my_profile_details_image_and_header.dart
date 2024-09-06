import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/feature/authentecation/model/user_model.dart';
import 'package:dating_app/feature/my_profile_details/widgets/my_profile_details_header.dart';
import 'package:dating_app/feature/my_profile_details/widgets/my_profile_details_image.dart';
import 'package:dating_app/feature/profile_screen/date/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyProfileImageAndHeader extends StatelessWidget {
  const MyProfileImageAndHeader({
    super.key,
   // required this.userModel 
  });
 // final UserModel userModel ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.kPrimaryColor, )),
      child: Column(
        children: [
          BlocProvider(
            create: (context) => ProfileCubit()..initialize(),
            child:  MyProfileDetailsImage(),
          ),
          verticalSpacing(10),
          const MyProfileDetailsHeader(),
        ],
      ),
    );
  }
}
