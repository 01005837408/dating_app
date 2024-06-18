import 'package:dating_app/core/utils/assets.dart';
import 'package:dating_app/core/utils/const_text.dart';
import 'package:dating_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Container(

            height: 50,
            width: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle
            ),

            child: Image.asset(Assets.profileImage ),
          ),
          Text(ConstText.appName , style:AppStyle.font21bold ,),
          IconButton(onPressed: (){},
              icon: Icon(Icons.menu , color: Colors.black,size: 30,)),


        ],
      ),
    );
  }
}