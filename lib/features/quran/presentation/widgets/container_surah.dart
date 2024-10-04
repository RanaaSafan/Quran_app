import 'package:flutter/material.dart';
import '../../data/models/data.dart';

class ContainerSurah extends StatelessWidget {
  const ContainerSurah({super.key, required this.name});
  final String name; // Changed from List<Data> to List<Data>

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: Color(0xFF0288D5),
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
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name, // Safely access the first Data object's name
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}