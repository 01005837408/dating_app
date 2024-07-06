import 'package:dating_app/core/cubit/app_cubit.dart';
import 'package:dating_app/core/utils/assets.dart';
import 'package:dating_app/feature/authentecation/presentation/signIn/sign_in.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomImagAndTextButton extends StatefulWidget {
  const CustomImagAndTextButton({
    super.key,
  });

  @override
  State<CustomImagAndTextButton> createState() =>
      _CustomImagAndTextButtonState();
}

class _CustomImagAndTextButtonState extends State<CustomImagAndTextButton> {
  bool isToggled = false;
  void _toggle() {
    setState(() {
      isToggled = !isToggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              _toggle();
              if (isToggled) {
                BlocProvider.of<AppCubit>(context).setLangEn();
              } else {
                BlocProvider.of<AppCubit>(context).setLangAr();
              }
            },
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Image.asset(
                Assets.onbourdingImage,
                height: 32,
                width: 32,
              ),
            ),
          ),
          const Spacer(),
          TextButton(
              onPressed: () {
                // print('object');
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SignInScreen()));
                // Navigator.of(context).pushReplacementNamed(Routs.loginScreen);
              },
              child: Text(
                S.of(context).skip,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }
}
