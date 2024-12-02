import 'package:flutter/material.dart';

class HadithSheikh extends StatelessWidget {
  const HadithSheikh({super.key, required this.data});
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                data, // نص البيانات بشكل مباشر
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFFdd2c00),
                  decoration: TextDecoration.none,
                ),
                textDirection: TextDirection.rtl,
                maxLines: null, // لكي يتمكن النص من التوسيع في حال كان طويلًا
                overflow: TextOverflow.visible, // يضمن ظهور النص بشكل صحيح
              ),
            ),
          ],
        ),
      ),
    );
  }
}
