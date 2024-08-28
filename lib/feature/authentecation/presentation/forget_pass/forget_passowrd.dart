import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/utils/assets.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/utils/styles.dart';
import 'package:dating_app/core/widget/custom_materail_botton.dart';
import 'package:dating_app/core/widget/custom_text_field.dart';
import 'package:dating_app/feature/authentecation/data/cubit_forget_pass/auth_cubit.dart';
import 'package:dating_app/feature/authentecation/data/cubit_forget_pass/auth_state.dart';
import 'package:dating_app/feature/authentecation/presentation/signIn/sign_in.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  TextEditingController emailControler = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //height:$1.h height:\s*(\d+)  // width:\s*(\d+) //width:$1.w  //
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocProvider<AppForgetPasswordCubit>(
          create: (context) => AppForgetPasswordCubit(),
          child: BlocConsumer<AppForgetPasswordCubit, AppForgetPasswordState>(
            listener: (context, state) {
              if (state is AppSuccessForgetPasswordState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Check Your Email"),
                  ),
                );
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                    (route) => false);
              } else if (state is AppErrorForgetPasswordState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("please enter valid email"),
                  ),
                );
              }
            },
            builder: (context, state) {
              return Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: AppColor.kPrimaryColor,
                              size: 35,
                            )),
                        horizontalSpacing(80),
                        Text(S.of(context).restPass,
                            style: AppStyle.font21bold.copyWith(
                                color: AppColor.kPrimaryColor,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w900)),
                      ],
                    ),
                    verticalSpacing(50),
                    Image.asset(Assets.commentImage),
                    verticalSpacing(30),
                    Text(S.of(context).forgetPassText),
                    verticalSpacing(30),
                    CustomTextFormField(
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: AppColor.kPrimaryColor,
                      ),
                      hintText: S.of(context).hitTextforgetPass,
                      controller: emailControler,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return S.of(context).emailValid;
                        }
                      },
                    ),
                    verticalSpacing(30),
                    state is LoadedState
                        ? const Center(child: CircularProgressIndicator())
                        : CustomMaterialBottons(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<AppForgetPasswordCubit>(context)
                                    .resetPasswordLink(
                                        email: emailControler.text);
                              }
                            },
                            text: S.of(context).textButtonForgetPass,
                          )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
//  Future<void> resetPasswordWithLink() async {
//     try {
//       emit(ResetPasswordLoadingState());
//       await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);
//       emit(ResetPasswordSuccessState());
//     } catch (e) {
//       emit(ResetPasswordFailureState(errMessage: e.toString()));
//     }
//   }
