import 'package:flutter/material.dart';

// Extend PreferredSizeWidget
class ContainerAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ContainerAppbar({super.key});

  // Specify the preferred size for the AppBar
  @override
  Size get preferredSize => const Size.fromHeight(100.0); // Adjust the height as needed

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF0F227C),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          gradient: const LinearGradient(
            colors: [Color(0xff3B53B1), Color(0xff364AAA)], // تدرج لوني
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50.0), // تحديد ارتفاع الـ AppBar
        child: Container(
          height: 50.0, // ارتفاع الـ Container
          alignment: Alignment.centerLeft, // محاذاة النص إلى اليسار
          padding: const EdgeInsets.only(left: 10.0), // إضافة حشوة على اليسار
          child: const Text(
            'Al Quran',
            style: TextStyle(color: Colors.white, fontSize: 30), // تنسيق النص
          ),
        ),
      ),
    );
  }
}
