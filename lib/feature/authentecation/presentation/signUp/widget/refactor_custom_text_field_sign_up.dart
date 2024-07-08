// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/utils/const_text.dart';
import 'package:dating_app/core/utils/styles.dart';
import 'package:dating_app/core/widget/custom_materail_botton.dart';
import 'package:dating_app/core/widget/custom_text_field.dart';
import 'package:dating_app/feature/authentecation/data/cubit_sign_up/auth_sign_up_cubit.dart';
import 'package:dating_app/feature/authentecation/data/cubit_sign_up/auth_sign_up_state.dart';
import 'package:dating_app/feature/authentecation/presentation/signIn/sign_in.dart';
import 'package:dating_app/feature/authentecation/presentation/signUp/widget/dont_have_account.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RefactorCustomTextFormFieldSignUp extends StatelessWidget {
  RefactorCustomTextFormFieldSignUp({super.key});

  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passControllerSure = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  User user = FirebaseAuth.instance.currentUser!;

  final formKey = GlobalKey<FormState>();
 

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (context) => UserCubit(),
      child: BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
            if (state is UserLoaded) {
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
              textDirection: TextDirection.ltr,
              child: Column(
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      children: [
                        Text(ConstText.fName,
                            style: AppStyle.font21bold
                                .copyWith(color: Colors.black, fontSize: 16)),
                        horizontalSpacing(128),
                        Text(ConstText.lastName,
                            style: AppStyle.font17W400
                                .copyWith(color: Colors.black)),
                      ],
                    ),
                  ),
                  verticalSpacing(10),
                  Row(
                    children: [
                      Container(
                        width: 140,
                        child: CustomTextFormField(
                            controller: fNameController,
                            inputType: TextInputType.name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "الحقل فارغ";
                              }
                            }),
                      ),
                      horizontalSpacing(50),
                      Container(
                        width: 140,
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
                  verticalSpacing(30),
                  Align(
                      alignment: Alignment.topRight,
                      child: Text(ConstText.emailTitle,
                          style: AppStyle.font21bold
                              .copyWith(color: Colors.black, fontSize: 16))),
                  verticalSpacing(10),
                  CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "برجاء ادخال البريد الالكتروني";
                        }
                      },
                      controller: emailController,
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: AppColor.kPrimaryColor,
                        size: 30,
                      )),
                  verticalSpacing(10),
                  Align(
                      alignment: Alignment.topRight,
                      child: Text(ConstText.passTitle,
                          style: AppStyle.font21bold
                              .copyWith(color: Colors.black, fontSize: 16))),
                  verticalSpacing(10),
                  CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "برجاء ادخال الرقم السري";
                        }
                      },
                      controller: passController,
                      suffixIcon: const Icon(
                        Icons.lock,
                        color: AppColor.kPrimaryColor,
                        size: 30,
                      ),
                      prefixIcon: const Icon(Icons.visibility_off)),
                  verticalSpacing(10),
                  verticalSpacing(30),
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
                          text: ConstText.createAcount),
                  verticalSpacing(10),
                  DontHaveAnAccount(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  
}
