import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/common.dart';
import 'custom_widget.dart';
import 'fadeInAnimation.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool flag = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  void _login(){

      if (formKey.currentState?.validate()?? false) {
        print("Login successful");
      } else {
        // النموذج يحتوي على أخطاء
        print("Form is not valid");
      }

  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FadeInAnimation(
                  delay: 1,
                  child: IconButton(
                      onPressed: () {
                        GoRouter.of(context)
                            .pushNamed(Routers.authenticationpage.name);
                      },
                      icon: const Icon(
                        CupertinoIcons.back,
                        size: 35,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInAnimation(
                        delay: 1.3,
                        child: Text(
                          "Welcome back! Glad ",
                          style: Common().titelTheme,
                        ),
                      ),
                      FadeInAnimation(
                        delay: 1.6,
                        child: Text(
                          "to see you, Again!",
                          style: Common().titelTheme,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                    child: Column(
                      children: [
                        FadeInAnimation(
                          delay: 1.9,
                          child: CustomTextFormField(
                            hinttext: 'Enter your email',
                            obsecuretext: false,
                            controller: emailController,
                            validator: _validateEmail,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FadeInAnimation(
                          delay: 2.2,
                          child: CustomPasswordTextFormField(
                            hinttext: "Enter Your password",
                            obsecuretext: true,
                            controller: passwordController,
                            validator: _validatePassword,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FadeInAnimation(
                          delay: 2.5,
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  GoRouter.of(context)
                                      .pushNamed(Routers.forgetpassword.name);
                                },
                                child: Text(
                                  "Forget Password?",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Urbanist-SemiBold",
                                  ),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FadeInAnimation(
                          delay: 2.8,
                          child: CustomElevatedButton(
                            message: "Login",
                            onPressed: _login,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: Column(
                      children: [
                        FadeInAnimation(
                          delay: 2.2,
                          child: Text(
                            "Or Log with",
                            style: Common().semiboldblack,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        FadeInAnimation(
                          delay: 2.4,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, right: 30, left: 30),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // SvgPicture.asset(
                                //     "assets/images/facebook_ic (1).svg"),
                                // SvgPicture.asset("assets/images/google_ic-1.svg"),
                                // Image.asset(
                                //   "assets/images/Vector.png",
                                //   color: Colors.grey,
                                // )
                                Image.asset(
                                  height: 50,
                                  width: 50,
                                  "assets/facebook.jpg",
                                ),
                                Image.asset(
                                  height: 50,
                                  width: 50,
                                  "assets/google.jpg",
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset(
                                    "assets/iphone.jpg",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                FadeInAnimation(
                  delay: 2.8,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account?",
                          style: Common().hinttext,
                        ),
                        TextButton(
                            onPressed: () {
                              GoRouter.of(context)
                                  .pushNamed(Routers.signuppage.name);
                            },
                            child: Text(
                              "Register Now",
                              style: Common().mediumTheme,
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
