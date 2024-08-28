import 'package:dating_app/core/model/view_my_profile_model.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewMyProfile extends StatelessWidget {
  const ViewMyProfile({super.key, required this.viewMyProfileModel});
  final List<ViewMyProfileModel> viewMyProfileModel;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(
        color: AppColor.kPrimaryColor,
      ),
      itemCount: viewMyProfileModel.length,
      itemBuilder: (context, index) => ListTile(
        leading: CircleAvatar(
          backgroundImage: viewMyProfileModel[index].image,
        ),
        title: Text(
          viewMyProfileModel[index].title,
          style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),
        subtitle: Text(viewMyProfileModel[index].subtitle),
      ),
    );
  }
}
