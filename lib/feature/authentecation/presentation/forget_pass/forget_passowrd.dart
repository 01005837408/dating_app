import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/utils/assets.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/utils/const_text.dart';
import 'package:dating_app/core/utils/styles.dart';
import 'package:dating_app/core/widget/custom_materail_botton.dart';
import 'package:dating_app/core/widget/custom_text_field.dart';
import 'package:dating_app/feature/authentecation/data/cubit_forget_pass/auth_cubit.dart';
import 'package:dating_app/feature/authentecation/data/cubit_forget_pass/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPassword extends StatelessWidget {
   ForgetPassword({super.key});
   TextEditingController emailControler = TextEditingController();
   final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocProvider<AppForgetPasswordCubit>(
  create: (context) => AppForgetPasswordCubit(),
  child: BlocConsumer<AppForgetPasswordCubit, AppForgetPasswordState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Form(
          key:formKey,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  },
                      icon: const Icon(Icons.arrow_back , color: AppColor.kPrimaryColor, size: 35,)),
                  horizontalSpacing(80),
                  Text("اعاده تعيين" , style: AppStyle.font21bold.copyWith(color: AppColor.kPrimaryColor ,
                      fontSize: 24, fontWeight: FontWeight.w900)),
                ],
              ),
              verticalSpacing(50),
              Image.asset(Assets.commentImage),
              verticalSpacing(30),
              Text(ConstText.forgetPassText),
              verticalSpacing(30),
              CustomTextFormField(
                prefixIcon: Icon(Icons.email_outlined, color: AppColor.kPrimaryColor,),
                hintText: ConstText.hitTextforgetPass,
                controller: emailControler,
                validator: (value){
                  if(value!.isEmpty){
                    return "من فضلك أدخل البريد الالكتروني" ;
                  }
                },

              ),
              verticalSpacing(30),
              CustomMaterialBottons(onPressed: (){
                if(formKey.currentState!.validate()){
                  BlocProvider.of<AppForgetPasswordCubit>(context).resetPasswordLink(email: emailControler.text);
                  

                }
              },
                  text: ConstText.textButtonForgetPass,

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
