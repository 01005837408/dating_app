import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/feature/authentecation/model/user_model.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dating_app/feature/edit_profile_screen/data/edit_profile_cubit.dart';

class QuickViewInMyProfile extends StatelessWidget {
  const QuickViewInMyProfile({
    required this.userModel,
    Key? key,
  }) : super(key: key);
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit(FirebaseAuth.instance.currentUser),
      child: BlocBuilder<EditProfileCubit, EditProfileState>(
        builder: (context, state) {
          final lifeStyleList = state.editProfileLifeStyleList;
          final cultureList = state.editProfileCalutreList;

          // Extracting work and education from the state
          String work = '';
          String education = '';

          for (var lifeStyle in lifeStyleList) {
            if (lifeStyle.title == 'Job') {
              work = lifeStyle.subtitle;
            }
          }

          for (var culture in cultureList) {
            if (culture.title == 'Education') {
              education = culture.subtitle;
            }
          }

          return Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).work,
                    style: const TextStyle(
                        color: AppColor.kPrimaryColor, fontSize: 20),
                  ),
                  Text(
                    work,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    S.of(context).maritalStatus,
                    style: const TextStyle(
                        color: AppColor.kPrimaryColor, fontSize: 20),
                  ),
                  Text(
                    S.of(context).single,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).education,
                    style: const TextStyle(
                        color: AppColor.kPrimaryColor, fontSize: 20),
                  ),
                  Text(education),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    S.of(context).religion,
                    style: const TextStyle(
                        color: AppColor.kPrimaryColor, fontSize: 20),
                  ),
                  Text(S.of(context).Muslim),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
