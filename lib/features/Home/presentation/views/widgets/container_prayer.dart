import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:quran_app/core/utils/common.dart';

class ContainerPrayer extends StatefulWidget {
  final String time;
  final String Prayer;
  const ContainerPrayer({super.key, required this.time, required this.Prayer});

  @override
  State<ContainerPrayer> createState() => _ContainerPrayerState();
}

class _ContainerPrayerState extends State<ContainerPrayer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFFfbe9e7),  // لون خلفية هادئ
          boxShadow: [
            BoxShadow(
              color: Color(0xFFFFA500).withOpacity(0.3), // ظل برتقالي خفيف
              spreadRadius: 1,
              blurRadius: 3,
            )
          ],
          border: Border.all(
            color: Color(0xFFFFA500), // لون الحدود برتقالي
            width: 2, // سُمك الحد
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.time,
                    style: TextStyle(
                      fontFamily: 'NotoSans', // استخدام خط ناعم
                      fontSize: 35,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF333333), // لون النص قاتم
                    ),
                  ),
                  Spacer(),
                  Text(
                    widget.Prayer,
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333), // لون النص قاتم
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  // Icon(
                  //   FlutterIslamicIcons.prayingPerson,
                  //   size: 40,
                  //   color: Color(0xffFFFFFF).withOpacity(0.5),
                  // )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
