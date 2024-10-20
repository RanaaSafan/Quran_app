import 'package:flutter/material.dart';

class Dhikr extends StatelessWidget {
  const Dhikr({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 5),
                  color: Colors.white.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 5,
                )
              ]),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Text(
                "0000",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -40),
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: Colors.blueAccent,
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 5,
                  )
                ]),
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      maximumSize: const Size(80, 80),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        shape: BoxShape.circle,
                      ),
                      child: Text("Tap",style: TextStyle(fontSize: 10,color: Colors.white),),
                    ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      maximumSize: const Size(20, 20),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        shape: BoxShape.circle,
                      ),
                      child: Text("reset",style: TextStyle(fontSize: 10,color: Colors.white),),
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }
}
