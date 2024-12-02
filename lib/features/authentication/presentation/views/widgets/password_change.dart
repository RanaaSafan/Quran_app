
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/common.dart';
import 'custom_widget.dart';
import 'fadeInAnimation.dart';

class PasswordChange extends StatefulWidget {
  const PasswordChange({super.key});

  @override
  State<PasswordChange> createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<PasswordChange> {
  void onpressed(){

      GoRouter.of(context).pushReplacement(Routers.loginpage.name);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFE8ECF4),
      body: SafeArea(
        child: Column(
          children: [
            LottieBuilder.asset("assets/ticker.json"),
            FadeInAnimation(
              delay: 1,
              child: Text(
                "Password Changed!",
                style: Common().titelTheme,
              ),
            ),
            FadeInAnimation(
              delay: 1.5,
              child: Text(
                "Your password has been changed successfully",
                style: Common().mediumThemeblack,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FadeInAnimation(
              delay: 2,
              child: CustomElevatedButton(
                message: "Back to Login",
               onPressed: onpressed,
              //  color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}