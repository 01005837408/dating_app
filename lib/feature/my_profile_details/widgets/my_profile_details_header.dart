import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/utils/const_text.dart';
import 'package:flutter/material.dart';

class MyProfileDetailsHeader extends StatelessWidget {
  const MyProfileDetailsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    ConstText.online,
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20)),
                  )
                ],
              ),
              const Text(
                ConstText.id,
                style: TextStyle(fontSize: 19),
              )
            ],
          ),
          const Spacer(),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Icon(Icons.person, color: AppColor.kPrimaryColor),
                  Text(
                    'Hadi . 21',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    ConstText.cairoEgypt,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19),
                  ),
                  Icon(Icons.location_on, color: AppColor.kPrimaryColor),
                ],
              ),
              Row(
                children: [
                  Text(
                    ConstText.male,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19),
                  ),
                  Icon(Icons.male, color: AppColor.kPrimaryColor),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
