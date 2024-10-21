import 'package:flutter/material.dart';
import 'package:quran_app/features/Home/presentation/views/widgets/dhikr.dart';

class TasbeehConatinerDhikr extends StatelessWidget {
  final String data;
  const TasbeehConatinerDhikr({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dhikr(data: data), // Pass the data to the new screen
            ),
          );
        },
        child: Material( // Wrap the Container in Material
          color: Colors.transparent, // Keep the material transparent so that the container's color is visible
          child: Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              color: const Color(0xFF0A2060),
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xffFFFFFF),
                  spreadRadius: 0.5,
                  blurRadius: 2,
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  data,
                  style: const TextStyle(fontSize: 25, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
