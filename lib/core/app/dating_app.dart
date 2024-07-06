import 'package:dating_app/core/cubit/app_cubit.dart';
import 'package:dating_app/core/helper/cache_helper.dart';
import 'package:dating_app/feature/home/screens/bottom_navigation.dart';
import 'package:dating_app/feature/home/screens/home_screen.dart';
import 'package:dating_app/feature/onbourding_screen/onboard.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  // git fetch origin
  // git merge origin/main
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: SafeArea(
        child: BlocProvider(
          create: (context) => AppCubit(),
          child: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              return MaterialApp(
                locale: CacheHelper.sharedPreferences?.getString('lang') == 'ar'
                    ? const Locale('ar')
                    : const Locale('en'),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,
                home: const Onboard(),
              );
            },
          ),
        ),
      ),
    );
  }
}
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//  List  data = [];
//   getDate() async {
//   QuerySnapshot querySnapshot = await  firestore.collection("users").get();
//     data.addAll(querySnapshot.docs);
//     setState(() {
      
//     });
//   }

// Hi Hassan                                                                                                                                                      
//  Thank you for reaching out and considering me for the Flutter 
//  developer position. I appreciate the opportunity and am interested 
//  in learning more about the role.