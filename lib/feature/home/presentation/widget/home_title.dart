import 'package:dating_app/core/utils/assets.dart';
import 'package:dating_app/core/utils/styles.dart';
import 'package:dating_app/feature/match_filtter/match_filtter_screen.dart';
import 'package:dating_app/feature/profile_screen/date/profile_cubit.dart';
import 'package:dating_app/feature/profile_screen/date/profile_state.dart';
import 'package:dating_app/feature/profile_screen/profile_screen.dart';

import 'package:dating_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..initialize(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const MatchFiltter(),
                  ),
                );
              },
              icon: const Icon(
                Icons.settings_input_composite_rounded,
                color: Colors.black,
                size: 30,
              ),
            ),
            Text(
              S.of(context).appName,
              style: AppStyle.font21bold,
            ),
            GestureDetector(
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
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                      radius: 25,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
