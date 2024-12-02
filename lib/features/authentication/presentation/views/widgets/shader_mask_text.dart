import 'package:flutter/material.dart';
import 'package:quran_app/features/authentication/presentation/views/screens/signUp_page.dart';
import '../screens/login_page.dart';

class ShaderMaskText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  const ShaderMaskText({
    Key? key,
    required this.text,
    required this.style,
    required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        );
      },
      child: Text(
        text,
        style: style.copyWith(color: Colors.white),
      ),
    );
  }
}
