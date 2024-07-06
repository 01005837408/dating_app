import 'package:dating_app/core/model/profile_model.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileBodyItem extends StatelessWidget {
  const ProfileBodyItem({
    super.key,
    required this.profileList,
    required this.index,
  });

  final List<ProfileModel> profileList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.lightPink.withOpacity(0.5),
      ),
      child: ListTile(
        onTap: profileList[index].onTap,
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            profileList[index].text,
            style: const TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
            textAlign: TextAlign.right,
          ),
        ),
        leading: profileList[index].iconButton,
        trailing: profileList[index].icon,
      ),
    );
  }
}
