import 'package:dating_app/core/function/show_taost.dart';
import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/utils/const_text.dart';
import 'package:dating_app/core/utils/styles.dart';
import 'package:dating_app/core/widget/custom_materail_botton.dart';
import 'package:dating_app/core/widget/custom_text_field.dart';
import 'package:dating_app/feature/authentecation/data/cubit_login/auth_login_cubit.dart';
import 'package:dating_app/feature/authentecation/data/cubit_login/auth_login_state.dart';
import 'package:dating_app/feature/authentecation/presentation/forget_pass/forget_passowrd.dart';
import 'package:dating_app/feature/authentecation/presentation/signUp/sign_up.dart';
import 'package:dating_app/feature/home/screens/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RefactorCustomTextFormFieldSignIn extends StatelessWidget {
  RefactorCustomTextFormFieldSignIn({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passControllerSure = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppLoginCubit>(
      create: (context) => AppLoginCubit(),
      child: BlocConsumer<AppLoginCubit, AppLoginState>(
        listener: (context, state) {
          if (state is AppLoginSuccessState) {
            showToast(message: "تم بجيل الدخول بنجاح");
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const ButtomNavigation()));
          } else if (state is AppLoginErrorState) {
            showToast(message: state.error);
          } else {
            showToast(message: "حدث خطأ اثناء تسجيل الدخول");
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Column(
              children: [
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
                      return null;
                    },
                    controller: emailController,
                    suffixIcon: const Icon(
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
                      return null;
                    },
                    controller: passController,
                    suffixIcon: const Icon(
                      Icons.lock,
                      color: AppColor.kPrimaryColor,
                      size: 30,
                    ),
                    prefixIcon: const Icon(Icons.visibility_off)),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgetPassword()));
                  },
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "نسيت كلمه السر ؟",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColor.kPrimaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                verticalSpacing(30),
                state is AppLoginLoadingState
                    ? const CircularProgressIndicator()
                    : CustomMaterialBottons(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<AppLoginCubit>(context).userLogin(
                                email: emailController.text,
                                password: passController.text);
                          }
                        },
                        text: ConstText.createAcount,
                      ),
                verticalSpacing(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      ConstText.notHaveAcount,
                      style: AppStyle.font17W400.copyWith(color: Colors.black),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ));
                        },
                        child: Text(
                          ConstText.createNewAcount,
                          style: AppStyle.font17W400
                              .copyWith(color: AppColor.kPrimaryColor),
                        ))
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
