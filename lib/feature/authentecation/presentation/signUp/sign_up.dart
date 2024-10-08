// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, unused_local_variable

import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/utils/assets.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:dating_app/core/utils/styles.dart';
import 'package:dating_app/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'widget/refactor_custom_text_field_sign_up.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.kPrimaryColor,
        body: Column(
          children: [
            //BackIconInSignUp(),

            verticalSpacing(60.h),
            Expanded(
              child: Container(
                // height:639.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.r),
                      topRight: Radius.circular(40.r),
                    )),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: EdgeInsets.all(20.0.r),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          verticalSpacing(10.h),
                          Text(
                            S.of(context).createNewAcount,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.sp.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          verticalSpacing(80.h),

                          RefactorCustomTextFormFieldSignUp(
                              // userModal: SignUpUserModal.fromJson(),
                              ),
                          // Divider(
                          //   thickness: 1,
                          //   color: Colors.black,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Divider(
                                thickness: 1,
                                color: Colors.black,
                              ),
                            ],
                          ),

                          verticalSpacing(20.h),
                          MaterialButton(
                            height: 50.h,
                            color: AppColor.kPrimaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.r))),
                            onPressed: () async {
                              final googleSignIn = GoogleSignIn();
                              final googleAcoont = await googleSignIn.signIn();
                              print(googleAcoont!.email);
                              final googleCredential =
                                  await googleAcoont.authentication;
                              final authCredential =
                                  GoogleAuthProvider.credential(
                                accessToken: googleCredential.accessToken,
                                idToken: googleCredential.idToken,
                              );
                              final firebaseUser = await FirebaseAuth.instance
                                  .signInWithCredential(authCredential);
                              //  addUser();
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             ButtomNavigation(
                              //               user: state.us,
                              //             )));
                            },
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 25,
                                  backgroundImage:
                                      AssetImage(Assets.googleImage),
                                ),
                                SizedBox(width: 30.w),
                                Text(
                                  S.of(context).createAcountByGoogle,
                                  style:TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    //fontWeight: 
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class BackIconInSignUp extends StatelessWidget {
  const BackIconInSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 16),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          height: 50.h,
          width: 50.h,
          decoration: BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
