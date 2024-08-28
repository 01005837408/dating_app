import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/model/payment_header_model.dart';

class PaymentHeaderListViewItem extends StatefulWidget {
  const PaymentHeaderListViewItem({
    super.key,
    required this.paymentModel,
    required this.index,
    this.selectIndex,
  });

  final List<PaymentHeaderModel> paymentModel;
  final int index;
  final int? selectIndex;

  @override
  State<PaymentHeaderListViewItem> createState() =>
      _PaymentHeaderListViewItemState();
}

class _PaymentHeaderListViewItemState extends State<PaymentHeaderListViewItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
          child: Container(
            width: 110.h.w,
            height: 210.h.h,
            decoration: BoxDecoration(
                border: Border.all(
                    width: widget.selectIndex != null &&
                            widget.selectIndex != widget.index
                        ? 1
                        : 3,
                    color: widget.selectIndex != null &&
                            widget.selectIndex != widget.index
                        ? Colors.black
                        : Colors.pink.shade500),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: widget.paymentModel[widget.index].numbersOfMonths,
                    style:  TextStyle(
                        fontSize: 30.sp, fontWeight: FontWeight.w700),
                  ),
                ),
                 Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: 'Month',
                    style: TextStyle(fontSize: 20.sp),
                  ),
                ),
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: widget.paymentModel[widget.index].price,
                    style:  TextStyle(fontSize: 20.sp),
                  ),
                ),
                widget.selectIndex != null && widget.selectIndex != widget.index
                    ? const SizedBox.shrink()
                    : Container(
                        height: 25.h,
                        width: 75.h.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.pink.shade500),
                        child: const Center(
                          child: Text(
                            'text 70%',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
        widget.selectIndex != null && widget.selectIndex != widget.index
            ? const SizedBox.shrink()
            : Positioned(
                left: 35.w,
                child: Container(
                  height: 20.h,
                  width: 65.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.pink.shade500),
                  child: const Center(
                    child: Text(
                      'text',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
