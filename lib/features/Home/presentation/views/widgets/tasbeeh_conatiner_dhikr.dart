import 'package:flutter/material.dart';
import 'package:quran_app/features/Home/presentation/views/widgets/dhikr.dart';

class TasbeehConatinerDhikr extends StatelessWidget {
  final String data;
  const TasbeehConatinerDhikr({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0), // زيادة التباعد قليلاً
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dhikr(data: data), // Pass the data to the new screen
            ),
          );
        },
        child: Material( // Wrap the Container in Material
          color: Colors.transparent, // Keep the material transparent
          child: Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient( // تدرج لوني لتحسين المظهر
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFd84315).withOpacity(0.8), // اللون الأساسي
                  Color(0xFFd84315).withOpacity(0.4), // اللون الفاتح في الأسفل
                ],
              ),
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12, // ظل أكثر نعومة
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center, // وضع النص في المنتصف
              children: [
                Text(
                  data,
                  style: TextStyle(
                    fontSize: 24, // حجم خط أصغر قليلاً
                    fontWeight: FontWeight.bold, // خط عريض لجذب الانتباه
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black45,
                        offset: Offset(2.0, 2.0),
                      ),
                    ], // إضافة ظل للنص لجعله أكثر وضوحاً
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
