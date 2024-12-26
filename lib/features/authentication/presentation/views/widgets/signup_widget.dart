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
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool? _iscorrect = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
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

  String? _validateConfirmPassword(String? value) {
    if (value != passwordController.text) {
      return 'Passwords do not match';
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
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: formKey, // Set the formKey to the Form widget
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FadeInAnimation(
                        delay: 1.6,
                        child: Text(
                          "البريد الالكتروني ",
                          style:Common().Login,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    FadeInAnimation(
                      delay: 1.9,
                      child: CustomTextFormField(
                        hinttext: 'ادخل بريدك الالكتروني ',
                        obsecuretext: false,
                        controller: nameController,
                        validator: _validateName,
                      ),
                    ),

                    const SizedBox(height: 15),
                    FadeInAnimation(
                        delay: 2.2,
                        child: Text(
                          " كلمه المرور  ",
                          style: Common().Login,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    FadeInAnimation(
                      delay: 2.5,
                      child: CustomPasswordTextFormField(
                        hinttext: "ادخل كلمه المرور",
                        obsecuretext: true,
                        controller: passwordController,
                        validator: _validatePassword,
                      ),
                    ),
                    const SizedBox(height: 15),
                    FadeInAnimation(
                        delay: 2.8,
                        child: Text(
                          " تأكيد كلمه المرور  ",
                          style:Common().Login,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    FadeInAnimation(
                      delay: 3.1,
                      child: CustomPasswordTextFormField(
                        hinttext: " ادخل كلمه المرور  ",
                        obsecuretext: true,
                        validator: _validateConfirmPassword,
                        controller:
                            confirmPasswordController, // استخدام الcontroller الجديد
                      ),
                    ),
                    const SizedBox(height: 15),
                  FadeInAnimation(
                    delay: 3.4,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Expanded(
                          child: RichText(
                          text: TextSpan(
                            text: '', // لا تحتاج لنص هنا لأننا سنستخدم children لإضافة الكلمات
                            children: [
                              TextSpan(
                                text: 'أوافق علي ',
                                style: TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                              TextSpan(
                                text: 'شروط خدمة ',
                                style: TextStyle(color: Color(0xFFA85000), fontSize: 15),
                              ),
                              TextSpan(
                                text: ' المنصة و',
                                style: TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                              TextSpan(
                                text: 'سياسة الخصوصية ',
                                style: TextStyle(color: Color(0xFFA85000), fontSize: 15),
                              ),
                            ],
                          ),
                                                    ),
                        ),

                       Theme(
                        data: Theme.of(context).copyWith(
                          checkboxTheme: CheckboxThemeData(
                            side: BorderSide(color: Colors.grey, width: 2), // لون وسمك حدود الـCheckbox
                            checkColor: MaterialStateProperty.all(Colors.white),
                          //  activeColor: Colors.blue, // لون علامة الصح
                          ),
                        ),
                        child: Checkbox(
                          value: _iscorrect,
                          onChanged: (bool? value) {
                            setState(() {
                              _iscorrect = value ?? false;
                            });
                          },
                        ),
                                               ),
                              ]
                    ),
                  ),

                  const SizedBox(height: 20),
                    FadeInAnimation(
                      delay: 3.7,
                      child: CustomElevatedButton(
                        message: "تسجيل الدخول ",
                        onPressed: _register,
                        //  color: Colors.black,
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
                        delay: 4.0,
                        child: Text(
                          "خيارات تسجيل الدخول الاخري",
                          style: Common().semiboldblack,
                        ),
                      ),
                      const SizedBox(height: 12),
                      FadeInAnimation(
                        delay: 4.3,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, right: 50, left: 50),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                height: 40,
                                width: 40,
                                "assets/facebook.jpg",
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Image.asset(
                                height: 40,
                                width: 40,
                                "assets/google.jpg",
                              ),
                              SizedBox(
                                width: 20,
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
    );
  }
}
