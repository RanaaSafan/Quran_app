import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/common.dart';

class ContainerAyahDay extends StatelessWidget {
  const ContainerAyahDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 280, // Slightly increased height for more space
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Color(0xFF522700),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 6, // Softer shadow for a more elegant look
              offset: Offset(0, 4), // Slightly raised shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bookmark_border, // Changed icon for better match
                    color: Colors.white,
                    size: 28, // Slightly larger icon for better visibility
                  ),
                  SizedBox(width: 10),
                  Text(
                    "آية اليوم",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30), // More space for the main text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "وَٱسۡتَعِینُوا۟ بِٱلصَّبۡرِ وَٱلصَّلَوٰةِۚ وَإِنَّهَا لَكَبِیرَةٌ إِلَّا عَلَى ٱلۡخَـٰشِعِینَ",
                style: Common().ContainerAyahAndHadith,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20), // Space between text and the bottom
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "- سورة البقرة, آية 45",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
