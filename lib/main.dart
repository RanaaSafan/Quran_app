import 'package:flutter/material.dart';

import 'features/quran/presentation/views/quran_screen.dart';
import 'features/quran/presentation/widgets/list_view_surah.dart';
import 'features/quran/presentation/widgets/tab_bar_juzSurah.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabBarJuzsurah(),
    );
  }
}

