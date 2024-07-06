import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/widget/custom_materail_botton.dart';
import 'package:dating_app/core/widget/custom_appbar.dart';
import 'package:dating_app/feature/payment_screen/widgets/payment_header_listview.dart';
import 'package:dating_app/feature/payment_screen/widgets/payment_listview_body.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../core/utils/colors.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  widget: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                  backgroundColor: AppColor.kPrimaryColor,
                  text: S.of(context).subscribeNow,
                ),
                verticalSpacing(10),
                //
                PaymentHeaderListView(),
                verticalSpacing(20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  child: Text(
                    S.of(context).advatges,
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                const Divider(
                  endIndent: 30,
                  indent: 30,
                  thickness: 1.5,
                  color: AppColor.kPrimaryColor,
                ),
                const PaymentBodyListView(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    S.of(context).ruleText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                verticalSpacing(10),
                CustomMaterialBottons(

                    backgroundBottonsColors: AppColor.lightRed,
                    onPressed: () {},
                    text: 'احصل علي 3 اشهر بمبلغ 999ج'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
