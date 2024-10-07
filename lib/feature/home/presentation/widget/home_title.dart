import 'package:dating_app/feature/home/presentation/widget/user_image.dart';
import 'package:dating_app/feature/match_filtter/match_filtter_screen.dart';
import 'package:dating_app/feature/profile_screen/date/profile_cubit.dart';

import 'package:dating_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTitle extends StatelessWidget {
  HomeTitle({this.onPressed, this.iconButton, this.text, super.key});
  void Function()? onPressed;
  Widget? iconButton;
  String? text;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..initialize(),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 0.0, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            iconButton ??
                IconButton(
                  onPressed: onPressed ??
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const MatchFiltter(),
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
              //S.of(context).appName
              text ?? S.of(context).appName,
              style:  TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            UserImage(),
          ],
        ),
      ),
    );
  }
}
