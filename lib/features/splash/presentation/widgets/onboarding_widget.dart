import 'package:flutter/material.dart';
import '../../data/onboarding_data.dart';

class OnboardingWidget extends StatelessWidget {
  final OnboardingData data;

  const OnboardingWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          data.imagePath,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover, // لضبط حجم الصورة مع حجم الشاشة
        ),
        Container(
          alignment: Alignment.topCenter, // تحديد مكان النص أو المحتوى
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                data.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Text(
                data.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
