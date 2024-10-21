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
        width: 250,
        height: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFF0A2060),
            boxShadow: [
              BoxShadow(
                color: Color(0xffFFFFFF),
                spreadRadius: 0.5,
                blurRadius: 2,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.Prayer,
                style: TextStyle(
                  fontFamily: 'NotoSans', // استخدام خط Roboto
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFFFFFF),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.time,
                    style: TextStyle(
                      fontFamily: 'NotoSans', // استخدام خط Roboto
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    FlutterIslamicIcons.prayingPerson,
                    size: 40,
                    color: Color(0xffFFFFFF).withOpacity(0.5),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
