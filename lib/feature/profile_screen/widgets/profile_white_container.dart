import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/feature/payment_screen/payment_screen.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class WhitContainerProfile extends StatelessWidget {
  const WhitContainerProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 150,
      top: 430,
      left: 50,
      right: 50,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          children: [
            verticalSpacing(15),
            const Icon(
              Icons.lock,
              color: AppColor.kPrimaryColor,
              size: 45,
            ),
            verticalSpacing(20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentScreen(),
                    ));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.kPrimaryColor,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    S.of(context).subscribeNow,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
