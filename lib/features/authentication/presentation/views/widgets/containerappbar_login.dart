import 'package:flutter/material.dart';

// Extend PreferredSizeWidget
class ContainerappbarLogin extends StatelessWidget implements PreferredSizeWidget {
  const ContainerappbarLogin({super.key});

  // Specify the preferred size for the AppBar
  @override
  Size get preferredSize => const Size.fromHeight(100.0); // Adjust the height as needed

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 150.0, // الارتفاع الكلي عند تمدد الـ SliverAppBar
      pinned: true, // لجعل الـ SliverAppBar يبقى مرئيًا في الأعلى عند التمرير
      backgroundColor: Color(0xFF0F227C), // خلفية اللون
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            gradient: const LinearGradient(
              colors: [Color(0xFF1D56B3), Color(0xff364AAA)], // تدرج لوني
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 5.0), // إضافة حشوة على اليسار للنص
          child: Column(
            children: [
              Center(
                child: Text(
                  'أولي العزم',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ),
              Text(
                'قم بتسجيل الدخول أو إنشاء حساب جدبد لحفظ تقدمك',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),

            ],
          ),
        ),
        centerTitle: false, // محاذاة العنوان إلى اليسار
      ),
    );
  }
}