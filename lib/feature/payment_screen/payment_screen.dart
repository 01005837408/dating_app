import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/utils/const_text.dart';
import 'package:dating_app/core/widget/custom_materail_botton.dart';
import 'package:dating_app/core/widget/custom_appbar.dart';
import 'package:dating_app/feature/payment_screen/widgets/payment_header_listview.dart';
import 'package:dating_app/feature/payment_screen/widgets/payment_listview_body.dart';
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const CustomAppBar(
                widget: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
                backgroundColor: AppColor.kPrimaryColor,
                text: ConstText.subscribeNow,
              ),
              PaymentHeaderListView(),
              verticalSpacing(30),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  ConstText.advatges,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              const Divider(
                endIndent: 60,
                indent: 60,
                thickness: 1.5,
                color: AppColor.kPrimaryColor,
              ),
              PaymentBodyListView(),
              verticalSpacing(5),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  ConstText.ruleText,
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              verticalSpacing(10),
              Center(
                child: CustomMaterialBottons(
                    backgroundBottonsColors: AppColor.lightRed,
                    onPressed: () {},
                    text: 'احصل علي 3 اشهر بمبلغ 999ج'),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
