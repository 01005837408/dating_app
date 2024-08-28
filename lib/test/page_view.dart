import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TestPageView extends StatelessWidget {
  TestPageView({super.key});
  PageController pageController = PageController(
      // viewportFraction: 0.5
      );
  String imageUrl =
      "https://as1.ftcdn.net/v2/jpg/02/43/12/34/1000_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100.h,
          ),
          SizedBox(
              height: 200.h,
              child: ListView(
                children: [
                  SizedBox(
                      height: 200.h,
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: 10,
                        itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(imageUrl),
                              )),
                        ),
                      ))
                ],
              )),
           SizedBox(
            height: 50.h,
          ),
          SmoothPageIndicator(
              controller: pageController,
              count: 10,
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.blue,
              ))
        ],
      ),
    );
  }
}
