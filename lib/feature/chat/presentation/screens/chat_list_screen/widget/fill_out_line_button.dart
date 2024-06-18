
import 'package:flutter/material.dart';

class filledOutLineButton extends StatelessWidget {
  filledOutLineButton({
    super.key,
    required this.text,
    required this.press,
    required this.isFilled,

  });
  String text ;
  final VoidCallback press ;
  bool isFilled = true ;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: press,
      elevation: isFilled ? 5: 0,
      color: isFilled ? Colors.white : Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          width: 1,
          color: Colors.white,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isFilled ? Colors.blue : Colors.white,
          fontSize: 16,  ),
      ),
    );
  }
}
