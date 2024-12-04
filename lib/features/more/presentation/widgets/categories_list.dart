import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:quran_app/features/Hadith/presentation/views/screens/hadith_screen.dart';

import '../views/screens/asmaa_allah_screen.dart';



class CategoriesList extends StatelessWidget {
  final String name;

  const CategoriesList({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switch (name) {
          case "اسماء الله الحسني":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AsmaaAllahScreen()),
            );
          default:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("الميزة غير متوفرة حالياً: $name")),
            );
        }
      },
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF5B2C00), Color(0xFF3E1F00)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FlutterIslamicIcons.solidQuran2,
              size: 60,
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}