import 'package:dating_app/core/model/payment_header_model.dart';
import 'package:dating_app/feature/payment_screen/widgets/payment_header_listview_item.dart';
import 'package:flutter/material.dart';

class PaymentHeaderListView extends StatelessWidget {
  PaymentHeaderListView({super.key});
  final List<PaymentHeaderModel> paymentModel = [
    PaymentHeaderModel(numbersOfMonths: '3', price: '900'),
    PaymentHeaderModel(numbersOfMonths: '6', price: '1500'),
    PaymentHeaderModel(numbersOfMonths: '12', price: '2000'),
    PaymentHeaderModel(numbersOfMonths: '24', price: '3800'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentModel.length,
        itemBuilder: (context, index) => PaymentHeaderListViewItem(
          paymentModel: paymentModel,
          index: index,
        ),
      ),
    );
  }
}
