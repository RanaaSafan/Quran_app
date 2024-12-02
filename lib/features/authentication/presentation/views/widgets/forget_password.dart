import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/common.dart';
import 'custom_widget.dart';
import 'fadeInAnimation.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();

  }
  void onpressed() {
    GoRouter.of(context).pushNamed(Routers.otpverification.name);
  }

  String? _validateEmail2(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  void _sendcode() {
    if (formKey.currentState?.validate() ?? false) {
      print("Login successful");
      GoRouter.of(context).push(Routers.otpverification.name);
    } else {
      print("Form is not valid");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInAnimation(
                  delay: 1,
                  child: IconButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      icon: const Icon(
                        CupertinoIcons.back,
                        size: 35,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FadeInAnimation(
                        delay: 1.3,
                        child: Text(
                          "نسيت كلمه المرور ؟",
                          style: Common().titelTheme,
                          textAlign: TextAlign.end,
                        ),
                      ),
                      SizedBox(height: 5,),
                      FadeInAnimation(
                        delay: 1.6,
                        child: Text(
                          "أدخل بريدك الإلكتروني لإعادة تعيين كلمة المرور الخاصة بك، وسنرسل لك رمز التأكيد",
                          style: Common().mediumThemeblack,
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FadeInAnimation(
                            delay: 1.9,
                            child: Text(
                              "البريد الالكتروني ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.end,
                            ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FadeInAnimation(
                          delay: 2.1,
                          child: CustomTextFormField(
                            hinttext: 'ادخل البريد الالكتروني ',
                            obsecuretext: false,
                            validator:_validateEmail2 ,
                            controller:emailController,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        FadeInAnimation(
                          delay: 2.1,
                          child: CustomElevatedButton(
                            message: "ارسال ",
                            onPressed: _sendcode,
                            //  color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Spacer(),
                // FadeInAnimation(
                //   delay: 2.4,
                //   child: Padding(
                //     padding: const EdgeInsets.only(left: 50),
                //     child: Row(
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         Text(
                //           "Don’t have an account?",
                //           style: Common().hinttext,
                //         ),
                //         TextButton(
                //             onPressed: () {
                //               GoRouter.of(context)
                //                   .pushNamed(Routers.signuppage.name);
                //             },
                //             child: Text(
                //               "Register Now",
                //               style: Common().mediumTheme,
                //             )),
                //       ],
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
