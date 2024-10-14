
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/common.dart';
import 'custom_widget.dart';
import 'fadeInAnimation.dart';

class SignupWidegt extends StatefulWidget {
  const SignupWidegt({super.key});

  @override
  State<SignupWidegt> createState() => _SignupWidegtState();
}

class _SignupWidegtState extends State<SignupWidegt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FadeInAnimation(
                delay: 0.6,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInAnimation(
                      delay: 0.9,
                      child: Text(
                        "Hello! Register to get  ",
                        style: Common().titelTheme,
                      ),
                    ),
                    FadeInAnimation(
                      delay: 1.2,
                      child: Text(
                        "started",
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
                        delay: 1.5,
                        child:  CustomTextFormField(
                          hinttext: 'Enter your Username',
                          obsecuretext: false, controller: TextEditingController(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FadeInAnimation(
                        delay: 1.8,
                        child:  CustomTextFormField(
                          hinttext: 'Enter your Email',
                          obsecuretext: false, controller: TextEditingController(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FadeInAnimation(
                        delay: 2.1,
                        child:   CustomPasswordTextFormField(hinttext: "Enter Your password", obsecuretext: true, controller: TextEditingController(),),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FadeInAnimation(
                        delay: 2.4,
                        child:  CustomPasswordTextFormField(hinttext: "Confirm Your password", obsecuretext: true, controller: TextEditingController(),),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeInAnimation(
                        delay: 2.7,
                        child: CustomElevatedButton(
                          message: "Register",
                         onPressed: (){},
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  height: 160,
                  width: double.infinity,
                  child: Column(
                    children: [
                      FadeInAnimation(
                        delay: 2.9,
                        child: Text(
                          "Or Register with",
                          style: Common().semiboldblack,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeInAnimation(
                        delay: 3.2,
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
                              height:50,
                              width: 50,
                              "assets/facebook.jpg",

                            ),
                              Image.asset(
                                height:50,
                                width: 50,
                                "assets/google.jpg",

                              ),
                              Image.asset(
                                height:50,
                                width: 50,
                                "assets/iphone.jpg",

                              ),
                            ],
                          ),
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
    );
  }
}