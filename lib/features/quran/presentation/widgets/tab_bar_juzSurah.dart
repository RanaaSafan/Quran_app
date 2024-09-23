import 'package:flutter/material.dart';

import 'list_view_juz.dart';
import 'list_view_surah.dart';

class TabBarJuzsurah extends StatefulWidget {
  const TabBarJuzsurah({super.key});

  @override
  State<TabBarJuzsurah> createState() => _TabBarJuzsurahState();
}

class _TabBarJuzsurahState extends State<TabBarJuzsurah> with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicator: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20),
              ),
              labelStyle: const TextStyle(fontSize: 15),
              indicatorPadding: const EdgeInsets.symmetric(vertical: 10),
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(text: "Juz"),
                Tab(text: "Surah"),
              ],
            ),
          ),
        ),
        // Expanded widget to hold the TabBarView
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              // The content/screens for each tab
             ListViewSurah(),
              ListViewJuz(),
            ],
          ),
        ),
      ],
    );
  }
}