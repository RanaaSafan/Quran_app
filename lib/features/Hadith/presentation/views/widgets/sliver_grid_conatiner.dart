import 'package:flutter/material.dart';
import '../widgets/hadith_container.dart';

class SliverGridContainer extends StatelessWidget {
  const SliverGridContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // عدد الأعمدة
          crossAxisSpacing: 10.0, // المسافة بين الأعمدة
          mainAxisSpacing: 10.0, // المسافة بين الصفوف
          childAspectRatio: 0.85, // نسبة العرض إلى الارتفاع
        ),
        delegate: SliverChildBuilderDelegate(
              (context, index) => HadithContainer(),
          childCount: 8, // عدد العناصر في الشبكة
        ),
      ),
    );
  }
}
