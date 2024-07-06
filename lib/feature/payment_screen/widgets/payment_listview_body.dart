import 'package:dating_app/core/model/payment_body_model.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class PaymentBodyListView extends StatelessWidget {
  const PaymentBodyListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PaymentBodyModel> paymentListView = [
      PaymentBodyModel(
        title: S.of(context).noLimitsTalks,
        leading: const Icon(Icons.check),
        trailing: const Icon(Icons.chat_bubble),
      ),
      PaymentBodyModel(
        title: S.of(context).unlockYourMesasges,
        leading: const Icon(Icons.check),
        trailing: const Icon(Icons.lock_rounded),
      ),
      PaymentBodyModel(
        title: S.of(context).findsBestMatchs,
        leading: const Icon(Icons.check),
        trailing: const Icon(Icons.favorite_sharp),
      ),
    ];
    return SizedBox(
      // height: MediaQuery.of(context).size.height / 3,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: paymentListView.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            title: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                paymentListView[index].title,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                // textAlign: TextAlign.right,
              ),
            ),
            trailing: Icon(
              paymentListView[index].leading.icon,
              color: AppColor.kPrimaryColor,
              size: 30,
            ),
            leading: Icon(
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
