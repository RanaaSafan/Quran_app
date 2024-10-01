import 'package:flutter/material.dart';
import 'container_appbar.dart';
import 'list_view_juz.dart';
import 'list_view_surah.dart';

class TabBarJuzsurah extends StatefulWidget {
  const TabBarJuzsurah({super.key});

  @override
  State<TabBarJuzsurah> createState() => _TabBarJuzsurahState();
}

class _TabBarJuzsurahState extends State<TabBarJuzsurah> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // تعريف الألوان في المتغيرات لتسهيل الصيانة
  final Color backgroundColor = const Color(0xFFF0F0F0); // خلفية رمادي فاتح جداً
  final Color tabBarColor = const Color(0xFFB3E5FC); // أزرق فاتح وهادئ
  final Color tabBorderColor = const Color(0xFF01579B); // أزرق داكن
  final Color tabIndicatorColor = const Color(0xFFE1F5FE); // أزرق فاتح جداً
  final Color selectedLabelColor = const Color(0xFF01579B); // لون النص عند التحديد
  final Color unselectedLabelColor = const Color(0xFF0288D1); // لون النص غير المحدد

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar:  ContainerAppbar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: Colors.transparent, // تعيين لون الخلفية كـ شفاف
              child: Container(
                height: 50,
                width: 400,
                decoration: BoxDecoration(
                  color: tabBarColor, // تعيين لون الخلفية للتبويبات
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: tabBorderColor, // لون الحواف
                    width: 1,
                  ),
                ),
                child: TabBar(
                  controller: _tabController,
                  labelColor: selectedLabelColor, // لون النص عند التحديد
                  unselectedLabelColor: unselectedLabelColor, // لون النص غير المحدد
                  indicator: BoxDecoration(
                    color: tabIndicatorColor, // لون المؤشر
                    borderRadius: BorderRadius.circular(25),
                  ),
                  labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  indicatorPadding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: const [
                    Tab(text: "Juz"),
                    Tab(text: "Surah"),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ListViewJuz(),
                ListViewSurah(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
