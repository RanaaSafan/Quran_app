import 'package:flutter/material.dart';
import 'package:quran_app/features/quran/presentation/widgets/list_view_shikh_names.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("قارئ الشيخ ",style: TextStyle(color: Color(0xFFA85000),fontSize: 30,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
      body: const ListViewShikhNames(),

      //TabBarJuzsurah(), // Ensure this widget is properly implemented
    );
  }
}

