import 'package:flutter/material.dart';

class HadithContainer extends StatefulWidget {
  const HadithContainer({super.key});

  @override
  State<HadithContainer> createState() => _HadithContainerState();
}

class _HadithContainerState extends State<HadithContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 900,
          width: 230,
          decoration: BoxDecoration(
            color: const Color(0xFF0A2060),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Positioned(
          top: 15,
          left: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              "https://img.pikbest.com/origin/09/19/98/717pIkbEsTKBr.jpg!sw800",
              width: 190,
              height: 190,
              fit: BoxFit.cover,
            ),
          ),
        ),

        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sunan",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.upload,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
