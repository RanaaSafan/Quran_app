import 'package:flutter/material.dart';
import 'package:quran_app/features/Home/presentation/views/widgets/tasbeeh_conatiner_dhikr.dart';

class ListTasbeehContainerDhikr extends StatefulWidget {
  ListTasbeehContainerDhikr({super.key});

  @override
  State<ListTasbeehContainerDhikr> createState() => _ListTasbeehContainerDhikrState();
}

class _ListTasbeehContainerDhikrState extends State<ListTasbeehContainerDhikr> {
  List<String> Data = [
    "سُبْحَانَ اللهِ ",
    "سُبْحَانَ اللهِ بِحَمْدِهِ، سُبْحَانَ رَبِّي الْعَظِيمِ ",
    "الْحَمْدُ للهِ ",
    "اللَّهُ أَكْبَرُ ",
    "أَسْتَغْفِرُ اللهَ الْعَظِيمَ ",
    "لَا إِلَٰهَ إِلَّا اللهُ ",
    "لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ ",
    "اللَّهُمَّ صَلِّ عَلَى سَيِّدِنَا مُحَمَّدٍ",
    "أَشْهَدُ أَنَّ مُحَمَّدًا رَسُولُ اللهِ ",
    "أَصْبَحْنَا وَأَصْبَحَ الْمُلْكُ لِلَّهِ ",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("اذكار",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),), // عنوان شريط التطبيق
        backgroundColor: Color(0xFFd84315).withOpacity(0.9), // لون خلفية شريط التطبيق
        centerTitle: true, // لوضع العنوان في المنتصف
        iconTheme: IconThemeData(
            size: 30,
                color: Colors.white,
        ),
      ),
      body: Container(
        //color: Color(0xFF0F227C), // Set the background color here
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: Data.length, // Number of prayer types
          itemBuilder: (BuildContext context, int index) {
            return TasbeehConatinerDhikr(data: Data[index]);
          },
        ),
      ),
    );
  }
}
