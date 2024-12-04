import 'package:flutter/material.dart';
import 'categories_list.dart';

class CategoriesGrid extends StatelessWidget {
  final List<String> categories = [
    "اسماء الله الحسني",
    "قصص الانبياء",
    "قصص النساء",
    "التفسير",
    "قصص الحيوان"
  ];

  CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "التصنيفات",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF3E1F00),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // عدد الأعمدة
            crossAxisSpacing: 16, // المسافة بين الأعمدة
            mainAxisSpacing: 16, // المسافة بين الصفوف
            childAspectRatio: 1, // نسبة العرض إلى الارتفاع
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoriesList(name: categories[index]);
          },
        ),
      ),
    );
  }
}
