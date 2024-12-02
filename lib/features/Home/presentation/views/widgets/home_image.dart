import 'package:flutter/material.dart';
import 'package:quran_app/features/Home/presentation/views/widgets/sleek_circle_slider.dart';

class HomeImage extends StatefulWidget {
  const HomeImage({super.key});

  @override
  State<HomeImage> createState() => _HomeImageState();
}

class _HomeImageState extends State<HomeImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/home.jpeg",
          width: double.infinity,
          height: 250,
          fit: BoxFit.fill,

        ),
        Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            color: Color(0xFF000000).withOpacity(0.2),
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: Icon(
            Icons.notifications_active,
            size: 20,
            color: Color(0xFF522700),
          ),
        ),
        Positioned(
            left: 40,
            bottom: 90,
            child: Text(
              "الثلاثاء , 13 مارس",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
        SizedBox(
          height: 15,
        ),
        Positioned(
          left: 20,
          bottom: 50,
          child: Text(
            "رمضان | 1445 هجري 3",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        Positioned(
          right: 30,
          bottom: 20,
          child: Text(
            "الزقازيق , السلام",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        Positioned(
            right: 20,
            bottom: 30,
            child: SleekCircleSlider()),
      ],
    );
  }
}
