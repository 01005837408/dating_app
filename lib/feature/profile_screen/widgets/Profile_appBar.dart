import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.dart';
import '../../settings_profile/settings_Screen_profile.dart';

class ProfileAppBar extends StatefulWidget {
  const ProfileAppBar({super.key, required this.height});
  final double height;

  @override
  State<ProfileAppBar> createState() => _ProfileAppBarState();
}

class _ProfileAppBarState extends State<ProfileAppBar>  {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      height: widget.height.h,
      width: MediaQuery.of(context).size.width,

      child: Stack(children: [
        Positioned(
          left: 95.w,
          top: 10.h,
          child: Transform.rotate(
            angle: 0.5

            ,
            child:  Icon(
              Icons.favorite
              ,
              color:
              AppColor.kPrimaryColor.withOpacity(0.3)
              ,
              size: 90,
            ),
          ),
        ),
        Positioned(
          left: 180.w,
          top: 10.h,
          child: Transform.rotate(
            angle: -0.2

            ,
            child:  Icon(
              Icons.favorite
              ,
              color:
              AppColor.kPrimaryColor.withOpacity(0.3)
              ,
              size: 100,
            ),
          ),
        ),
        Positioned(
          left: 20.w,
          top: 75.h,
          child: Transform.rotate(
            angle: -0.9

            ,
            child:  Icon(
              Icons.favorite
              ,
              color:
              AppColor.kPrimaryColor.withOpacity(0.3)
              ,
              size: 70,
            ),
          ),
        ),
        Positioned(
          right: 20.w,
          top: 75.h,
          child: Transform.rotate(
            angle: 0.9

            ,
            child:  Icon(
              Icons.favorite
              ,
              color:
              AppColor.kPrimaryColor.withOpacity(0.3)
              ,
              size: 80,
            ),
          ),
        ),
         Positioned(
          left: 30,
          top: 24,
          child: InkWell(
            onTap: (){
              Navigator.pop(context)
              ;          },
            child: const CircleAvatar(
              radius: 26,
                backgroundColor: Color(0xFFEDB2C2),
              child: Icon(Icons.arrow_back,color: Color(0xFFFE3B72),
              size: 35,
              ),
            ),
          ),
        ),     Positioned(
          right: 30,
          top: 24,
          child: InkWell(
            onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreenProfile())),
            child: const Icon(Icons.settings,color: Color(0xFFFE3B72),
            size: 50,
            ),
          ),
        )
      ],),
    );
  }
}
