import 'package:flutter/material.dart';

class ContainerSurah extends StatelessWidget {
  const ContainerSurah({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.circular(17) ,
        ),
        child: Center(
          child: Row(
            children: [

              IconButton(onPressed: (){}, icon: Icon(Icons.send_sharp,size: 20,)),
              Spacer(),
              Text("Surah ",style: TextStyle(color: Colors.white,fontSize: 20),)
            ],
          ),
        ),
      ),
    );
  }
}
