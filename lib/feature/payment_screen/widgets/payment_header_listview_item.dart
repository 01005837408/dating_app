import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/model/payment_header_model.dart';

class PaymentHeaderListViewItem extends StatelessWidget {
  const PaymentHeaderListViewItem({
    super.key,
    required this.paymentModel,
    required this.index,
  });

  final List<PaymentHeaderModel> paymentModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 120.w,
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: paymentModel[index].numbersOfMonths,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
            ),
            const Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: 'Month',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: paymentModel[index].price,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
