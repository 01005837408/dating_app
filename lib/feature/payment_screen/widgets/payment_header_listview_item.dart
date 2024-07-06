import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/model/payment_header_model.dart';

class PaymentHeaderListViewItem extends StatefulWidget {
  const PaymentHeaderListViewItem({
    super.key,
    required this.paymentModel,
    required this.index,  this.selectIndex,
  });

  final List<PaymentHeaderModel> paymentModel;
  final int index;
  final int ?selectIndex;

  @override
  State<PaymentHeaderListViewItem> createState() => _PaymentHeaderListViewItemState();
}

class _PaymentHeaderListViewItemState extends State<PaymentHeaderListViewItem> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
          child: Container(
            width: 110.w,
            height: 210.h,
            decoration: BoxDecoration(
                border: Border.all(width:widget.selectIndex!=null&&widget.selectIndex!=widget.index? 1:3,color: widget.selectIndex!=null&&widget.selectIndex!=widget.index?Colors.black:Colors.pink.shade500), borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: widget.paymentModel[widget.index].numbersOfMonths,
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
                    text: widget.paymentModel[widget.index].price,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                widget.selectIndex!=null&&widget.selectIndex!=widget.index?const SizedBox.shrink():    Container(
                  height: 25,
                  width: 75.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.pink.shade500
                  ),
                  child: const Center(
                      child: Text('text 70%',style: TextStyle(
                          color: Colors.white
                      ),),),
                ),
              ],
            ),
          ),
        ),
        widget.selectIndex!=null&&widget.selectIndex!=widget.index?const SizedBox.shrink(): Positioned(
          left: 35.w,
          child: Container(
            height: 20,
            width: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.pink.shade500
            ),
            child: const Center(
              child: Text('text',style: TextStyle(
                color: Colors.white
              ),),
            ),
          ),
        ),
      ],
    );
  }
}
