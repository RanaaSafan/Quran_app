import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:quran_app/features/Home/presentation/views/screens/home_screen_version2.dart';
import 'package:quran_app/features/Home/presentation/views/widgets/qibla_compass.dart';

import '../../../../Hadith/presentation/views/screens/hadith_screen.dart';
import '../../../../quran/presentation/views/quran_screen.dart';
import '../screens/home_screen.dart';

class BottomNavigationHome extends StatefulWidget {
  const BottomNavigationHome({super.key});

  @override
  State<BottomNavigationHome> createState() => _BottomNavigationHomeState();
}

class _BottomNavigationHomeState extends State<BottomNavigationHome> {
  int currentIndex = 0;

  List<Widget> screens = [
    //QuranScreen(),
    HomeScreenVersion2(),
    QiblaCompass(),
    QuranScreen(),
    HomeScreen(),
    HadithScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Color(0xFF522700),
        color: Color(0xFF522700),
        animationDuration: const Duration(milliseconds: 300),
        items: const <Widget>[
          Icon(Icons.home, size: 26, color: Colors.white),
          Icon( FlutterIslamicIcons.qibla2, size: 26, color: Colors.white),
          Icon( FlutterIslamicIcons.quran2, size: 26, color: Colors.white),
          Icon( FlutterIslamicIcons.prayer, size: 26, color: Colors.white),
          Icon(Icons.mode, size: 26, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body:screens[currentIndex],
    );
  }
}