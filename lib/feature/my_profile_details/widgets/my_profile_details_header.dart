import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/generated/l10n.dart';
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
              const Row(
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
                    S.of(context).cairoEgypt,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 19),
                  ),
                  const Icon(Icons.location_on, color: AppColor.kPrimaryColor),
                ],
              ),
              Row(
                children: [
                  Text(
                    S.of(context).male,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 19),
                  ),
                  const Icon(Icons.male, color: AppColor.kPrimaryColor),
                ],
              )
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    S.of(context).online,
                    style: const TextStyle(fontSize: 20),
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
              Text(
                S.of(context).id,
                style: const TextStyle(fontSize: 19),
              )
            ],
          ),
        ],
      ),
    );
  }
}
