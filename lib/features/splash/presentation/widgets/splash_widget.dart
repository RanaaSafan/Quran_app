import 'package:flutter/material.dart';
import 'package:quran_app/features/authentication/presentation/views/screens/login_page.dart';
import 'package:quran_app/features/authentication/presentation/views/widgets/tab_bar_sign_login.dart';

import '../../../Home/presentation/views/screens/home_screen.dart';


class SplashWidget extends StatefulWidget {
  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
    _navigateToHome();
  }

  void _startAnimation() {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  void _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => TabBarSignLogin()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 2),
                child: Image.asset('assets/splash.png', width: double.infinity,height: double.infinity,fit: BoxFit.cover,), // إضافة الصورة
              ),
            ),

          ],
        ),
      ),
    );
  }
}
