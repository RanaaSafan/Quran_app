import 'package:flutter/material.dart';

// Extend PreferredSizeWidget
class ContainerAppbarHadith extends StatelessWidget implements PreferredSizeWidget {
  const ContainerAppbarHadith({super.key});

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
              colors: [Color(0xff3B53B1), Color(0xff364AAA)], // تدرج لوني
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 5.0), // إضافة حشوة على اليسار للنص
          child: Text(
            'Al Hadith',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        centerTitle: false, // محاذاة العنوان إلى اليسار
      ),
    );
  }
}
