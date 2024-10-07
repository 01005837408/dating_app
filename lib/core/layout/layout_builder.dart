import 'package:flutter/material.dart';

class LayOutScreen extends StatelessWidget {
  const LayOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxHieght = constraints.maxHeight;

        final maxWidth = constraints.maxWidth;

        print("maxHieght $maxHieght");
        print("maxWidth $maxWidth");
        
        return Container();
      },
    );
  }
}
