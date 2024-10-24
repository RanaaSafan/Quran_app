import 'package:flutter/material.dart';
import 'package:quran_app/features/quran/presentation/widgets/list_view_shikh_names.dart';
import 'package:quran_app/features/quran/presentation/widgets/tab_bar_juzSurah.dart';

import '../widgets/container_surah.dart';
class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F227C),
      appBar: AppBar(
        backgroundColor: Color(0xFF0F227C),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("Sheikh names",style: TextStyle(color: Colors.blueAccent,fontSize: 30),)
          ],
        ),
      ),
      body: const ListViewShikhNames(),

      //TabBarJuzsurah(), // Ensure this widget is properly implemented
    );
  }
}

