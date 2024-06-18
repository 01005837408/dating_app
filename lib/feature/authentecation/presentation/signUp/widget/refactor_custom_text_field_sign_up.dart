import 'dart:ffi';

import 'package:dating_app/core/function/show_taost.dart';
import 'package:dating_app/core/routs/const_route.dart';
import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/utils/const_text.dart';
import 'package:dating_app/core/utils/styles.dart';
import 'package:dating_app/core/widget/custom_materail_botton.dart';
import 'package:dating_app/core/widget/custom_text_field.dart';
import 'package:dating_app/feature/authentecation/data/cubit_sign_up/auth_sign_up_cubit.dart';
import 'package:dating_app/feature/authentecation/data/cubit_sign_up/auth_sign_up_state.dart';
import 'package:dating_app/feature/authentecation/presentation/signIn/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';



class RefactorCustomTextFormFieldSignUp extends StatelessWidget {
  RefactorCustomTextFormFieldSignUp({super.key});
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passControllerSure = TextEditingController();

  final formKey = GlobalKey<FormState>() ;
  @override
  Widget build(BuildContext context) {
    return  BlocProvider<AuthSignUpCubit>(
  create: (context) => AuthSignUpCubit(),
  child: BlocConsumer<AuthSignUpCubit, AuthSignUpState>(
  listener: (context, state) {
    if(state is AuthSignUpSuccess){
      showToast(
        message: "Created Successfully",
      );
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SignInScreen()));
      // Navigator.pushReplacement(context,
      //   MaterialPageRoute(builder: (context) => SignInScreen(),)
      // );

    } else if(state is AuthSignUpIFailure){
      showToast(
        message:state.error,
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

            Row(
              children: [
                Container(
                  width: 140,
                  child: CustomTextFormField(
                      controller: fNameController,
                      inputType: TextInputType.name,
                      validator: (value){
                        if(value!.isEmpty){
                          return "الحقل فارغ" ;
                        }
                      }
                  ),
                ),
                horizontalSpacing(50),
                Container(
                  width: 140,
                  child: CustomTextFormField(
                      controller: lNameController,
                      inputType: TextInputType.name,
                      validator: (value){
                        if(value!.isEmpty){
                          return "الحقل فارغ" ;
                        }
                      }
                  ),
                ),
              ],
            ),
            verticalSpacing(30),
            Align(
                alignment: Alignment.topRight,
                child: Text(ConstText.emailTitle , style:AppStyle.font21bold.copyWith(color:Colors.black , fontSize: 16 ))) ,
            verticalSpacing(10),
            CustomTextFormField(
              validator: (value){
                if(value!.isEmpty){
                  return "برجاء ادخال البريد الالكتروني" ;
                }
              },
                controller: emailController,
                prefixIcon: const Icon(Icons.email_outlined , color: AppColor.kPrimaryColor, size: 30,)
            ),
            verticalSpacing(10),
            Align(
                alignment: Alignment.topRight,
                child: Text(ConstText.passTitle , style:AppStyle.font21bold.copyWith(color:Colors.black , fontSize: 16 ))) ,
            verticalSpacing(10),
            CustomTextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return "برجاء ادخال الرقم السري" ;
                  }
                },
                controller: passController,
                suffixIcon: const Icon(Icons.lock , color: AppColor.kPrimaryColor, size: 30,),
                prefixIcon: const Icon(Icons.visibility_off)
            ),
            verticalSpacing(10),
            // Align(
            //     alignment: Alignment.topRight,
            //     child: Text(ConstText.passTitleSure , style:AppStyle.font21bold.copyWith(color:Colors.black , fontSize: 16 ))) ,
            // verticalSpacing(10),
            // CustomTextFormField(
            //   validator: (value){
            //     if(value!.isEmpty){
            //       return "برجاء تاكيد الرقم السري" ;
            //     }
            //   },
            //     controller: passControllerSure,
            //     suffixIcon: Icon(Icons.lock , color: AppColor.kPrimaryColor, size: 30,),
            //     prefixIcon: Icon(Icons.visibility_off_outlined , color:AppColor.kPrimaryColor ,)
            // ),
            verticalSpacing(30),
            state is AuthSignUpLoading ?  const CircularProgressIndicator()
            : CustomMaterialBottons(
                onPressed: (){
                  if(formKey.currentState!.validate()){
                    BlocProvider.of<AuthSignUpCubit>(context)
                        .signUpCreateUserAndPassword(
                        emailAddress: emailController.text, password: passController.text);

                  }
                },
                text: ConstText.createAcount),
            verticalSpacing(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(ConstText.doHaveAcount , style: AppStyle.font17W400.copyWith(color: Colors.black),),
                TextButton(onPressed: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignInScreen(),));
                },
                    child: Text(ConstText.enterLogin, style: AppStyle.font17W400.copyWith(color: AppColor.kPrimaryColor),)
                )
              ],
            ),
          ],
        ),
      ),
    );
  },
),
);
  }
}