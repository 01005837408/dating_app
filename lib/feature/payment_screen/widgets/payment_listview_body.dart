import 'package:dating_app/core/model/payment_body_model.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/utils/const_text.dart';
import 'package:flutter/material.dart';

class PaymentBodyListView extends StatelessWidget {
  PaymentBodyListView({super.key});
  final List<PaymentBodyModel> paymentListView = [
    PaymentBodyModel(
      title: ConstText.noLimitsTalks,
      leading: const Icon(Icons.check),
      trailing: const Icon(Icons.chat_bubble),
    ),
    PaymentBodyModel(
      title: ConstText.unlockYourMesasges,
      leading: const Icon(Icons.check),
      trailing: const Icon(Icons.lock_rounded),
    ),
    PaymentBodyModel(
      title: ConstText.findsBestMatchs,
      leading: const Icon(Icons.check),
      trailing: const Icon(Icons.favorite_sharp),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: ListView.builder(
        itemCount: paymentListView.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            title: Text(
              paymentListView[index].title,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              textAlign: TextAlign.right,
            ),
            leading: Icon(
              paymentListView[index].leading.icon,
              color: AppColor.kPrimaryColor,
              size: 30,
            ),
            trailing: Icon(
              paymentListView[index].trailing.icon,
              color: AppColor.kPrimaryColor,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
