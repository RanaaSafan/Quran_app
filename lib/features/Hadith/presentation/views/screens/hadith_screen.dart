import 'package:flutter/material.dart';

import '../widgets/container_appbar_hadith.dart';
import '../widgets/sliver_grid_conatiner.dart';

class HadithScreen extends StatefulWidget {
  const HadithScreen({super.key});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F227C),
      body: CustomScrollView(

          slivers: [
          const ContainerAppbarHadith(),
            const SliverGridContainer(),
          ]
    ),
    );
  }
}
