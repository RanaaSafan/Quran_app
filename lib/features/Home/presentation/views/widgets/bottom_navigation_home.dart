import 'package:flutter/material.dart';
import 'package:quran_app/features/Hadith/presentation/views/screens/hadith_screen.dart';
import 'package:quran_app/features/Home/presentation/views/screens/home_screen.dart';
import 'package:quran_app/features/quran/presentation/views/quran_screen.dart';

class BottomNavigationHome extends StatefulWidget {
  const BottomNavigationHome({super.key});

  @override
  State<BottomNavigationHome> createState() => _BottomNavigationHomeState();
}

class _BottomNavigationHomeState extends State<BottomNavigationHome> {
  int currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    QuranScreen(),
    HadithScreen(),
  ];

  void onTabIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F227C),
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          //color: Color(0xFF0F227C),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all( Radius.circular(30.0)),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color(0xFF061662),
              selectedItemColor: Color(0xFF025CA2),
              unselectedItemColor: Colors.grey,
              currentIndex: currentIndex,
              onTap: onTabIndex,
              items: [
                BottomNavigationBarItem(
                  icon: _buildIconWithBorder(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: _buildIconWithBorder(Icons.book_sharp),
                  label: 'Quran',
                ),
                BottomNavigationBarItem(
                  icon: _buildIconWithBorder(Icons.view_headline_outlined),
                  label: 'Hadith',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconWithBorder(IconData iconData) {
    return Container(
      padding: const EdgeInsets.all(8.0), // Padding around the icon
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), // Rounded shape
      //  border: Border.all(color: Color(0xFF0F227F), width: 2), // Border with color
      ),
      child: Icon(
        iconData,
        size: 20, // Icon size
      ),
    );
  }
}
