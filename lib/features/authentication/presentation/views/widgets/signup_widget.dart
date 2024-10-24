import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/common.dart';
import 'custom_widget.dart';
import 'fadeInAnimation.dart';

class SignupWidegt extends StatefulWidget {
  const SignupWidegt({super.key});

  @override
  State<SignupWidegt> createState() => _SignupWidegtState();
}

class _SignupWidegtState extends State<SignupWidegt> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose(); // Dispose nameController as well
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

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  void _register() {
    if (formKey.currentState?.validate() ?? false) {
      print("Login successful");
      // Navigate only if the form is valid
      GoRouter.of(context).push(Routers.loginpage.name);
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
            key: formKey, // Set the formKey to the Form widget
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
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
                            "Hello! Register to get",
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
                    child: Column(
                      children: [
                        FadeInAnimation(
                          delay: 1.5,
                          child: CustomTextFormField(
                            hinttext: 'Enter your Username',
                            obsecuretext: false,
                            controller: nameController,
                            validator: _validateName,
                          ),
                        ),
                        const SizedBox(height: 10),
                        FadeInAnimation(
                          delay: 1.8,
                          child: CustomTextFormField(
                            hinttext: 'Enter your Email',
                            obsecuretext: false,
                            controller: emailController,
                            validator: _validateEmail,
                          ),
                        ),
                        const SizedBox(height: 10),
                        FadeInAnimation(
                          delay: 2.1,
                          child: CustomPasswordTextFormField(
                            hinttext: "Enter Your password",
                            obsecuretext: true,
                            controller: passwordController,
                            validator: _validatePassword,
                          ),
                        ),
                        const SizedBox(height: 10),
                        FadeInAnimation(
                          delay: 2.4,
                          child: CustomPasswordTextFormField(
                            hinttext: "Confirm Your password",
                            obsecuretext: true,
                            validator: _validatePassword,
                            controller: passwordController,
                          ),
                        ),
                        const SizedBox(height: 20),
                        FadeInAnimation(
                          delay: 2.7,
                          child: CustomElevatedButton(
                            message: "Register",
                            onPressed: _register,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
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
                          const SizedBox(height: 12),
                          FadeInAnimation(
                            delay: 3.2,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, right: 30, left: 30),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    height: 40,
                                    width: 40,
                                    "assets/facebook.jpg",
                                  ),
                                  Image.asset(
                                    height: 40,
                                    width: 40,
                                    "assets/google.jpg",
                                  ),
                                  Image.asset(
                                    height: 40,
                                    width: 40,
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
        ),
      ),
    );
  }
}
