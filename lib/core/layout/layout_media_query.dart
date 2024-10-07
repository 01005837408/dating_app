import 'package:flutter/material.dart';

class LayOutMedialScreen extends StatelessWidget {
  const LayOutMedialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHieght = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    print("screen Hieght $screenHieght");
     print("screen Width $screenWidth");
    
    return Scaffold(
      //appBar: AppBar(),
      backgroundColor: Colors.green,
      body: Column(children: [
        Container(
          height: 250,
          color: Colors.blue,
        ),
         Container(
          height: 250,
          color: Colors.red,
        ),
        Container(
          height: 250,
          color: Colors.black,
        ),
      ]),
    );
  }
}
