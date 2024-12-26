import 'package:flutter/material.dart';

import '../../../../../core/utils/common.dart';

class ContainerHadithDay extends StatelessWidget {
  const ContainerHadithDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 320, // Increased height for better text spacing
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),

            color: Color(0xFF522700),


          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 6, // Softer shadow for elegance
              offset: Offset(0, 4), // Slightly raised shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bookmark_border, // Changed icon to be more fitting
                    color: Colors.white,
                    size: 30, // Larger icon for visibility
                  ),
                  SizedBox(width: 12),
                  Text(
                    "حديث اليوم",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "قال رسول الله ﷺ:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "إِنَّمَا الأَعْمَالُ بِالنِّيَّاتِ، وَإِنَّمَا لِكُلِّ امْرِئٍ مَا نَوَى، فَمَنْ كَانَتْ هِجْرَتُهُ إِلَى اللَّهِ وَرَسُولِهِ،",
                style: Common().ContainerAyahAndHadith,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "فَهِجْرَتُهُ إِلَى اللَّهِ وَرَسُولِهِ، وَمَنْ كَانَتْ هِجْرَتُهُ لِدُنْيَا يُصِيبُهَا أَوِ امْرَأَةٍ يَنْكِحُهَا، فَهِجْرَتُهُ إِلَى مَا هَاجَرَ إِلَيْهِ.",
                style: Common().ContainerAyahAndHadith,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "(رواه البخاري ومسلم)",
              style: Common().ContainerAyahAndHadith,
            ),
          ],
        ),
      ),
    );
  }
}
