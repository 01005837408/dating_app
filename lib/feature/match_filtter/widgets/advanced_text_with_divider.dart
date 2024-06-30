import 'package:dating_app/core/utils/const_text.dart';
import 'package:flutter/material.dart';

class AdvancedTextWithDivider extends StatelessWidget {
  const AdvancedTextWithDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 20, top: 10),
          child: Text(
            ConstText.advancedFiltters,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Divider(
          endIndent: 60,
          indent: 60,
          thickness: 3,
          color: Colors.white,
        ),
      ],
    );
  }
}
