import 'package:flutter/material.dart';
import 'package:quran_app/features/Home/presentation/views/widgets/container_counter_tasbeeh.dart';
import 'package:quran_app/features/Home/presentation/views/widgets/list_container_prayer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Prayer Time ",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
            Spacer(),
            Text("See all  ",style: TextStyle(color: Colors.white,fontSize: 15),),
          ],

        ),
        SizedBox(
          height: 5,
        ),
        ListContainerPrayer(),
        SizedBox(
          height: 5,
        ),
        ContainerCounterTasbeeh(),
      ],
    );
  }
}
