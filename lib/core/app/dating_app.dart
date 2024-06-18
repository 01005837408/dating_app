
import 'package:dating_app/test_chat/screens/home_chat.dart';
import 'package:dating_app/test_chat/screens/sign_in_chat.dart';
import 'package:dating_app/test_chat/screens/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../test_chat/screens/chat_screen_1.dart';

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return    ScreenUtilInit(
      designSize:  Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child:  SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home:ChatScreen(),
        ),
      ),
    );
  }

}