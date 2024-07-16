import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/feature/edit_profile_screen/data/edit_profile_cubit.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyProfileDetailsHeader extends StatelessWidget {
  const MyProfileDetailsHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit(FirebaseAuth.instance.currentUser),
      child: BlocBuilder<EditProfileCubit, EditProfileState>(
        builder: (context, state) {
          final basicInfoList = state.editProfileBasicList;

          // Extracting name, age, and location from the state
          String name = '';
          String age = '';
          String location = '';

          for (var basicInfo in basicInfoList) {
            if (basicInfo.title == 'First Name') {
              name = basicInfo.subtitle;
            } else if (basicInfo.title == 'Live In') {
              location = basicInfo.subtitle;
            }
          }
          final userName = state.editProfileBasicList
              .firstWhere((element) => element.title == 'First Name')
              .subtitle;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, color: AppColor.kPrimaryColor),
                        Text(
                          '$userName . $age',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          location,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 19),
                        ),
                        const Icon(Icons.location_on,
                            color: AppColor.kPrimaryColor),
                      ],
                    ),
                    // Additional rows for other basic info if needed
                  ],
                ),
                const Spacer(),
                // Additional details column if needed
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          S.of(context).online,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    ),
                    Text(
                      S.of(context).id,
                      style: const TextStyle(fontSize: 19),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
