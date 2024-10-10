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

  final Color backgroundColor = const Color(0xFF0F227C);
  final Color tabBarColor = const Color(0xFF5DB8EB);
  final Color tabBorderColor = const Color(0xFF01579B);
  final Color tabIndicatorColor = const Color(0xFFE1F5FE);
  final Color selectedLabelColor = const Color(0xFF01579B);
  final Color unselectedLabelColor = const Color(0xFF335FA0);

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
      body: CustomScrollView(
        slivers: [
          const ContainerAppbar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color: Colors.transparent,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: tabBarColor,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: tabBorderColor,
                      width: 1,
                    ),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    labelColor: selectedLabelColor,
                    unselectedLabelColor: unselectedLabelColor,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      color: tabIndicatorColor,
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
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 150, // Adjust this height according to your layout
              child: TabBarView(
                controller: _tabController,
                physics: const BouncingScrollPhysics(),
                children: const [
                  ListViewJuz(),
                  ListViewSurah(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
