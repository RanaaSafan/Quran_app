// import 'package:flutter/material.dart';
// import 'package:quran_app/features/quran/data/models/quran_edition.dart';
// import 'container_appbar.dart';
// import 'list_view_juz.dart';
// import 'list_view_surah.dart';
//
// class TabBarJuzsurah extends StatefulWidget {
//   const TabBarJuzsurah({super.key, required this.quran});
//   final QuranEdition quran;
//
//   @override
//   State<TabBarJuzsurah> createState() => _TabBarJuzsurahState();
// }
//
// class _TabBarJuzsurahState extends State<TabBarJuzsurah>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//
//   final Color backgroundColor = const Color(0xFF0F227C);
//   final Color tabBarColor = const Color(0xFF5DB8EB);
//   final Color tabBorderColor = const Color(0xFF01579B);
//   final Color tabIndicatorColor = const Color(0xFFE1F5FE);
//   final Color selectedLabelColor = const Color(0xFF01579B);
//   final Color unselectedLabelColor = const Color(0xFF335FA0);
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       body: NestedScrollView(  // دي عشان لكا اجي اعمل scroll لل container  and tabview  في نفس الوقت
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return <Widget>[
//             const ContainerAppbar(),
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Material(
//                   color: Colors.transparent,
//                   child: Container(
//                     height: 50,
//                     decoration: BoxDecoration(
//                       color: tabBarColor,
//                       borderRadius: BorderRadius.circular(25),
//                       border: Border.all(
//                         color: tabBorderColor,
//                         width: 1,
//                       ),
//                     ),
//                     child: TabBar(
//                       controller: _tabController,
//                       labelColor: selectedLabelColor,
//                       unselectedLabelColor: unselectedLabelColor,
//                       indicator: BoxDecoration(
//                         color: tabIndicatorColor,
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       labelStyle: const TextStyle(
//                           fontSize: 18, fontWeight: FontWeight.bold),
//                       indicatorPadding: EdgeInsets.zero,
//                       indicatorSize: TabBarIndicatorSize.tab,
//                       tabs: const [
//                         Tab(text: "Juz"),
//                         Tab(text: "Surah"),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ];
//         },
//         body: TabBarView(
//           controller: _tabController,
//           children: const [
//             ListViewJuz(),
//             ListViewSurah(quran:widget.quran ,),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:quran_app/features/quran/data/models/quran_edition.dart';
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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
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
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            const ListViewJuz(),
            ListViewSurah(quran: widget.quran), // Pass the quran to ListViewSurah
          ],
        ),
      ),
    );
  }
}
