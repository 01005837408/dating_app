import 'package:dating_app/core/routs/const_route.dart';
import 'package:dating_app/core/utils/assets.dart';
import 'package:dating_app/core/utils/const_text.dart';
import 'package:flutter/material.dart';

class CustomImagAndTextBottun extends StatelessWidget {
  const CustomImagAndTextBottun({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: Image.asset(
              Assets.onbourdingImage,
              height: 32,
              width: 32,
            ),
          ),
          const Spacer(),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(Routs.loginScreen);
              },
              child: const Text(
                ConstText.skip,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }
}
