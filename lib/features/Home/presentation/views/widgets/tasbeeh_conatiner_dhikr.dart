import 'package:flutter/material.dart';

class TasbeehConatinerDhikr extends StatelessWidget {
  final String data;
  const TasbeehConatinerDhikr({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
            color: Color(0xFF0A2060),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Color(0xffFFFFFF),
                spreadRadius: 0.5,
                blurRadius: 2,
              )
            ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Tasbeeh",style: TextStyle(fontSize: 25,color: Colors.white),),
          ],
        ),
      ),
    );
  }
}
