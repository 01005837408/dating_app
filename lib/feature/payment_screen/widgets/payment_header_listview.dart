import 'package:dating_app/core/model/payment_header_model.dart';
import 'package:dating_app/feature/payment_screen/widgets/payment_header_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentHeaderListView extends StatefulWidget {
  PaymentHeaderListView({super.key});

  @override
  State<PaymentHeaderListView> createState() => _PaymentHeaderListViewState();
}

class _PaymentHeaderListViewState extends State<PaymentHeaderListView> {
  final List<PaymentHeaderModel> paymentModel = [
    PaymentHeaderModel(numbersOfMonths: '3', price: '900'),
    PaymentHeaderModel(numbersOfMonths: '6', price: '1500'),
    PaymentHeaderModel(numbersOfMonths: '12', price: '2000'),
    PaymentHeaderModel(numbersOfMonths: '24', price: '3800'),
  ];
  int? selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentModel.length,
        itemBuilder: (context, index) {
          return InkWell(
            splashFactory: NoSplash.splashFactory,
            splashColor: Colors.transparent,
            enableFeedback: false,
            highlightColor: Colors.transparent,
            onTap: () {
              if (selectIndex == index) {
                setState(() {
                  selectIndex != null;
                });
              } else {
                setState(() {
                  selectIndex = index;
                });
              }
            },
            child: PaymentHeaderListViewItem(
              paymentModel: paymentModel,
              index: index,
              selectIndex: selectIndex!,
            ),
          );
        },
      ),
    );
  }
}
