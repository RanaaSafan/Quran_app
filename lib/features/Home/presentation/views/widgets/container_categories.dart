import 'package:flutter/material.dart';
import 'package:quran_app/features/Hadith/presentation/views/screens/hadith_screen.dart';
import 'package:quran_app/features/Home/presentation/views/widgets/date_calender.dart';
import 'package:quran_app/features/quran/presentation/views/quran_screen.dart';

import 'list_container_prayer.dart';
import 'list_tasbeeh_container_dhikr.dart';

class ContainerCategories extends StatelessWidget {
  final Icon namelogo;
  final String name;

  const ContainerCategories(
      {super.key, required this.namelogo, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {
          switch(name){
            case "التقويم":
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DateCalender()));
              break;
            case "الصلاه":
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ListContainerPrayer()));
              break;
            case "الحديث":
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HadithScreen()));
              break;
            case "القرآن":
              Navigator.push(context, MaterialPageRoute(builder: (context)=>QuranScreen()));
              break;
            case "التسبيح":
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ListTasbeehContainerDhikr()));
              break;

          }

        },
        child: Column(
          mainAxisSize: MainAxisSize.min, // <-- Crucial change
          children: [
            Container(
              width: 85,
              height: 115,
              decoration: BoxDecoration(
                color: const Color(0xFF522700),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(child: namelogo),
            ),
            const SizedBox(height: 8),
            SizedBox( // <-- Add SizedBox with constraints
              width: 85, // Match the width of the Container above
              child: Text(
                name,
                style: const TextStyle(
                  color: Color(0xFFA85000),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center, // Center the text
                overflow: TextOverflow.ellipsis, // Add ellipsis for long text
              ),
            ),
          ],
        ),
      ),
    );
  }

}