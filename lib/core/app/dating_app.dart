import 'package:dating_app/core/cubit/app_cubit.dart';
import 'package:dating_app/core/helper/cache_helper.dart';
import 'package:dating_app/core/layout/layout_builder.dart';
import 'package:dating_app/feature/splash_screen/splash_screen.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../layout/layout_media_query.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
                home: const SplashScreen(),
              );
            },
          ),
        ),
      ),
    );
  }

  bool isArabic() {
    return Intl.getCurrentLocale() == "ar";
  }
}
