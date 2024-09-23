import 'package:flutter/material.dart';

import 'features/quran/presentation/widgets/list_view_surah.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListViewSurah(),
    );
  }
}

