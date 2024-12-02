import 'package:flutter/material.dart';
import 'package:quran_app/features/quran/data/models/model_edition_surah/quran_edition.dart';
import 'container_appbar.dart';
import 'list_view_juz.dart';
import 'list_view_surah.dart';

class TabBarJuzsurah extends StatefulWidget {
  const TabBarJuzsurah({super.key, required this.quran});
  final QuranEdition quran;

  @override
  State<TabBarJuzsurah> createState() => _TabBarJuzsurahState();
}

class _TabBarJuzsurahState extends State<TabBarJuzsurah> with SingleTickerProviderStateMixin {
  late TabController _tabController;


  final Color tabBorderColor = const Color(0xFFA85000);
  final Color backgroundColor = const Color(0xFFFFFFFF);
  final Color tabBarColor = const Color(0xffEDEEEF);
  final Color tabIndicatorColor = const Color(0xFFFFFFFF);
  final Color selectedLabelColor =  const Color(0xFFA85000);
  final Color unselectedLabelColor = Colors.black;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this,initialIndex: 1);
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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const ContainerAppbar(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                        indicator: BoxDecoration(
                          color: tabIndicatorColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        indicatorPadding: EdgeInsets.zero,
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerHeight: 0,
                        tabs: const [
                          Tab(text: "الجزء"),
                          Tab(text: "السورة"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
             ListViewJuz(),
            ListViewSurah(quran: widget.quran), // Pass the quran to ListViewSurah
          ],
        ),
      ),

    );
  }
}
