import 'package:flutter/material.dart';

class ContainerSurah extends StatelessWidget {
  const ContainerSurah({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send_sharp, size: 20, color: Colors.white),
              ),
              const Text(
                "Surah",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(width: 10), // Adjust this as per your design
            ],
          ),
        ),
      ),
    );
  }
}
