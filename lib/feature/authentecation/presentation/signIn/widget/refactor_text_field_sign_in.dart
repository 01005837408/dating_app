// ignore_for_file: must_be_immutable
import 'dart:ui' as ui;
import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/utils/styles.dart';
import 'package:dating_app/core/widget/custom_materail_botton.dart';
import 'package:dating_app/core/widget/custom_text_field.dart';
import 'package:dating_app/feature/authentecation/data/cubit_sign_up/auth_sign_up_cubit.dart';
import 'package:dating_app/feature/authentecation/data/cubit_sign_up/auth_sign_up_state.dart';
import 'package:dating_app/feature/authentecation/presentation/forget_pass/forget_passowrd.dart';
import 'package:dating_app/feature/authentecation/presentation/signUp/sign_up.dart';
import 'package:dating_app/feature/home/presentation/screens/bottom_navigation.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class RefactorCustomTextFormFieldSignIn extends StatelessWidget {
  RefactorCustomTextFormFieldSignIn({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isArabic() {
    return Intl.getCurrentLocale() == "ar";
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (context) => UserCubit(),
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UserSuccessState) {
            FirebaseAuth.instance.currentUser!.emailVerified
                ? Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => ButtomNavigation(
                      user: state.user,
                    ),
                  ))
                : ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please Verify Your Account")),
                  );
          } else if (state is UserError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Directionality(
              textDirection:
                  isArabic() ? ui.TextDirection.rtl : ui.TextDirection.ltr,

              //  textDirection: ui.TextDirection.ltr,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(S.of(context).emailTitle,
                      style: AppStyle.font21bold
                          .copyWith(color: Colors.black, fontSize: 16.sp)),
                  verticalSpacing(10.h),
                  CustomTextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return S.of(context).emailValid;
                      }
                      return null;
                    },
                    controller: emailController,
                    suffixIcon: const Icon(
                      Icons.email_outlined,
                      color: AppColor.kPrimaryColor,
                      size: 30,
                    ),
                    // textDirection: isArabic() ? ui.TextDirection.rtl : ui.TextDirection.ltr,
                  ),
                  verticalSpacing(10),
                  Text(S.of(context).passTitle,
                      style: AppStyle.font21bold
                          .copyWith(color: Colors.black, fontSize: 16.sp)),
                  verticalSpacing(10),
                  CustomTextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return S.of(context).passValid;
                      }
                      return null;
                    },
                    controller: passController,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        color: Colors.black,
                        BlocProvider.of<UserCubit>(context)
                                    .obscurePasswordTextValue ==
                                true
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                      onPressed: () {
                        BlocProvider.of<UserCubit>(context)
                            .obscurePasswordText();
                      },
                    ),
                    obscureText: BlocProvider.of<UserCubit>(context)
                        .obscurePasswordTextValue,
                    //  textDirection: isArabic() ? TextDirection.rtl : TextDirection.ltr,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPassword()));
                    },
                    child: Text(
                      S.of(context).forgetPassword,
                      //textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: const ui.Color.fromARGB(255, 240, 95, 136),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  verticalSpacing(30),
                  state is UserLoading
                      ?const Center(child:  CircularProgressIndicator())
                      : CustomMaterialBottons(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<UserCubit>().login(
                                    emailController.text,
                                    passController.text,
                                  );
                            }
                          },
                          text: S.of(context).enterLogin,
                        ),
                  verticalSpacing(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).notHaveAcount,
                        style:TextStyle(
                            fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          ).copyWith(color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ));
                        },
                        child: Text(
                          S.of(context).createNewAcount,
                          style:TextStyle(
                            fontSize: 17.sp,
                          fontWeight: FontWeight.w400,
                          )
                              .copyWith(color: AppColor.kPrimaryColor),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
