import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SleekCircleSlider extends StatefulWidget {
  const SleekCircleSlider({super.key});

  @override
  State<SleekCircleSlider> createState() => _SleekCircleSliderState();
}

class _SleekCircleSliderState extends State<SleekCircleSlider> {
  double _sliderValue = 80;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: 180, // تحديد العرض الثابت
          height: 180, // تحديد الارتفاع الثابت
          child: Material( // استخدام Material لتوفير سطح تأثيرات الحبر
            type: MaterialType.transparency, // جعل Material شفافًا
            child: SleekCircularSlider(
              min: 0,
              max: 100,
              initialValue: _sliderValue.isNaN ? 0 : _sliderValue,
              onChange: (value) {
                setState(() {
                  _sliderValue = value.isNaN ? 0 : value;
                });
              },
              innerWidget: (double value) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'الفجر',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFA85000),
                        ),
                      ),
                      Text(
                        '04:39 ص',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF522700),
                        ),
                      ),
                      Text(
                        '-04:11:42',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFA85000),
                        ),
                      ),
                    ],
                  ),
                );
              },
              appearance: CircularSliderAppearance(
                customWidths: CustomSliderWidths(
                  handlerSize: 11,
                  progressBarWidth: 15,
                  trackWidth: 10,
                ),
                customColors: CustomSliderColors(
                  dotColor:Color(0xFFA85000) ,
                  progressBarColor: Color(0xFF522700),
                  trackColor: Colors.white,
                  hideShadow: true,
                ),
              ),
            ),
          ),

    );
  }
}
