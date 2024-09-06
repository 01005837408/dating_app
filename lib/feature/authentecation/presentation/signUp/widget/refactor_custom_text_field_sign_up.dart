// ignore_for_file: unused_local_variable, must_be_immutable
import 'dart:ui' as ui;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/utils/styles.dart';
import 'package:dating_app/core/widget/custom_materail_botton.dart';
import 'package:dating_app/core/widget/custom_text_field.dart';
import 'package:dating_app/feature/authentecation/data/cubit_sign_up/auth_sign_up_cubit.dart';
import 'package:dating_app/feature/authentecation/data/cubit_sign_up/auth_sign_up_state.dart';
import 'package:dating_app/feature/authentecation/presentation/signIn/sign_in.dart';
import 'package:dating_app/feature/authentecation/presentation/signUp/widget/dont_have_account.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class RefactorCustomTextFormFieldSignUp extends StatelessWidget {
  RefactorCustomTextFormFieldSignUp({super.key});

  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passControllerSure = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //User user = FirebaseAuth.instance.currentUser!;

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
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => SignInScreen(),
            ));
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(S.of(context).fName,
                          style: AppStyle.font21bold.copyWith(
                              color: Colors.black, fontSize: 16.sp.sp)),
                      horizontalSpacing(128.w),
                      Text(S.of(context).lastName,
                          style: AppStyle.font17W400
                              .copyWith(color: Colors.black)),
                    ],
                  ),
                  verticalSpacing(10.h),
                  Row(
                    children: [
                      Container(
                        width: 125.h.w,
                        child: CustomTextFormField(
                            controller: fNameController,
                            inputType: TextInputType.name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return S.of(context).last3Name;
                              }
                            }),
                      ),
                      horizontalSpacing(30),
                      Container(
                        width: 125.h.w,
                        child: CustomTextFormField(
                            controller: lNameController,
                            inputType: TextInputType.name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "الحقل فارغ";
                              }
                            }),
                      ),
                    ],
                  ),
                  verticalSpacing(30.h),
                  Align(
                      alignment:
                          isArabic() ? Alignment.topRight : Alignment.topLeft,
                      child: Text(S.of(context).emailTitle,
                          style: AppStyle.font21bold
                              .copyWith(color: Colors.black, fontSize: 16.sp))),
                  verticalSpacing(10),
                  CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "برجاء ادخال البريد الالكتروني";
                        }
                      },
                      controller: emailController,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: ui.Color.fromRGBO(254, 60, 114, 1),
                        size: 30.r,
                      )),
                  verticalSpacing(10.h),
                  Align(
                      alignment:
                          isArabic() ? Alignment.topRight : Alignment.topLeft,
                      child: Text(S.of(context).passTitle,
                          style: AppStyle.font21bold.copyWith(
                              color: Colors.black, fontSize: 16.sp.sp))),
                  verticalSpacing(10.h),
                  CustomTextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "برجاء ادخال الرقم السري";
                      }
                    },
                    controller: passController,
                    prefixIcon: const Icon(Icons.lock, color: Colors.black),
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
                    onChange: (password) {
                      BlocProvider.of<UserCubit>(context).password = password;
                    },
                  ),
                  verticalSpacing(40.h),
                  // verticalSpacing(30),
                  state is UserLoading
                      ? const CircularProgressIndicator()
                      : CustomMaterialBottons(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              context.read<UserCubit>().signUp(
                                    fNameController.text,
                                    lNameController.text,
                                    emailController.text,
                                    passController.text,
                                  );
                            }
                          },
                          text: S.of(context).createNewAcount),
                  verticalSpacing(10),
                  const DontHaveAnAccount(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
