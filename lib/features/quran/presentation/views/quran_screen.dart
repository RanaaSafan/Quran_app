import 'package:flutter/material.dart';
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
    return Column(
      children: [
        TabBarJuzsurah(),
        ContainerSurah(),
      ],
    );
  }
}
