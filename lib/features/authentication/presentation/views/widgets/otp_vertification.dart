import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:quran_app/features/authentication/presentation/views/widgets/tab_bar_sign_login.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/common.dart';
import 'custom_widget.dart';
import 'fadeInAnimation.dart';

class OtpVertification extends StatefulWidget {
  const OtpVertification({super.key});

  @override
  State<OtpVertification> createState() => _OtpVertificationState();
}

class _OtpVertificationState extends State<OtpVertification> {
  void onpressed() {
    GoRouter.of(context).pushNamed(Routers.newpassword.name);
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            height: 300,
            width: 250,
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: <Widget>[
                // الصورة تظهر أولًا
                SizedBox(height: 10),
                Image.asset(
                  'assets/Done.png',  // مسار الصورة في الـ assets
                  height: 90,  // يمكنك تعديل الحجم حسب الحاجة
                  width: 90,

                ),
                SizedBox(height: 10),
                Center(child: Text('تم بنجاح',style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize: 20),)),
                SizedBox(height: 10), // مساحة بين الصورة والنص
                Center(child: Text('لقد تم إعادة تعيين كلمة المرور الخاصة ')),
                SizedBox(height: 5),
                Center(child: Text('بك بنجاح')),
                SizedBox(height: 20), // مساحة بين النص والزران
                // الزر الذي يؤدي لتسجيل الدخول
                Center(
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF522700), Color(0xFFA85000)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: InkWell(
                      onTap: () {
                       // GoRouter.of(context).push(Routers..name);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => TabBarSignLogin()),
                        );
                      },
                      child: Center(
                        child: Text(
                          "تسجيل الدخول ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade800),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FadeInAnimation(
                    delay: 1.3,
                    child: Text(
                      "رمز التحقق ",
                      style: Common().titelTheme,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FadeInAnimation(
                    delay: 1.6,
                    child: Text(
                      "أدخل الرمز الذي أرسلناه إلى رقمك ****012345",
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
                  children: [
                    FadeInAnimation(
                      delay: 1.9,
                      child: Pinput(
                        length: 6,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        validator: (s) {
                          return s == '222222'
                              ? null
                              : 'الرمز خاطئ برجاء كتابه الرمز الصحيح ';
                        },
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        showCursor: true,
                        onCompleted: (pin) {
                          print(pin);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FadeInAnimation(
                      delay: 2.1,
                      child: Padding(
                        padding: const EdgeInsets.all(35.0),
                        child: CustomElevatedButton(
                          message: "تحقق ",
                          onPressed: () {
                            _showAlertDialog(context);
                          },
                          //       color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FadeInAnimation(
              delay: 2.4,
              child: Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context)
                            .pushNamed(Routers.otpverification.name);
                      },
                      child: Text(
                        "اعاده الارسال ",
                        style: Common().mediumTheme,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      "لم تستلم الرمز؟ ",
                      style: Common().hinttext,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
