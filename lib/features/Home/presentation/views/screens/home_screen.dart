import 'package:flutter/material.dart';
import 'package:quran_app/features/Home/presentation/views/widgets/container_counter_tasbeeh.dart';
import 'package:quran_app/features/Home/presentation/views/widgets/date_calender.dart';
import 'package:quran_app/features/Home/presentation/views/widgets/list_container_prayer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F227C),
      body: SingleChildScrollView( // إضافة SingleChildScrollView
        child: Column(
          children: [
            DateCalender(), // وضع DateCalender هنا ليظهر في أعلى الشاشة
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Prayer Time ",
                    style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "See all  ",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            ListContainerPrayer(),
            SizedBox(height: 5),
            ContainerCounterTasbeeh(),
          ],
        ),
      ),
    );
  }
}