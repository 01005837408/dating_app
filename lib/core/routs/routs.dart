import 'package:dating_app/core/routs/const_route.dart';
import 'package:dating_app/feature/authentecation/data/cubit_login/auth_login_cubit.dart';
import 'package:dating_app/feature/authentecation/data/cubit_sign_up/auth_sign_up_cubit.dart';
import 'package:dating_app/feature/authentecation/presentation/signIn/sign_in.dart';
import 'package:dating_app/feature/authentecation/presentation/signUp/sign_up.dart';
import 'package:dating_app/feature/onbourding_screen/onboard.dart';
import 'package:dating_app/feature/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpatailRouter {
  static Route<dynamic> generateRouts(RouteSettings settings) {
    switch (settings.name) {
      case Routs.splashScreen :
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case Routs.onboard :
        return MaterialPageRoute(builder: (_) => Onboard());
      case Routs.loginScreen :
        return MaterialPageRoute(builder: (_) =>
            BlocProvider<AppLoginCubit>(
              create: (context) => AppLoginCubit(),
              child: SignInScreen(),
            ));
      case Routs.registerScreen :
        return MaterialPageRoute(builder: (_) =>
            BlocProvider<AuthSignUpCubit>(
              create: (context) => AuthSignUpCubit(),
              child: SignUpScreen(),
            ));
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}