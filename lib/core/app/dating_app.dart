import 'package:dating_app/feature/home/screens/bottom_navigation.dart';
import 'package:dating_app/feature/home/screens/home_screen.dart';
import 'package:dating_app/feature/profile_photos/profile_photos_screen.dart';
import 'package:dating_app/feature/splash_screen/splash_screen.dart';
import 'package:dating_app/test/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ProfilePhotosScreen(),
        ),
      ),
    );
  }
}
